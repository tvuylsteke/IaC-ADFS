Configuration DscConfADFSServer
{
    Import-DscResource -ModuleName PSDesiredStateConfiguration, xDSCDomainjoin
    $dscDomainAdmin = Get-AutomationPSCredential -Name 'addcDomainAdmin'
    $dscDomainName = Get-AutomationVariable -Name 'addcDomainName'

    node ADFS
    {
	    WindowsFeature ADFS 
        { 
            Ensure = "Present" 
            Name = "ADFS-Federation"		
        }	  

        xDSCDomainjoin JoinDomain
		{
			Domain = $dscDomainName 
			Credential = $dscDomainAdmin
		}
    }
}