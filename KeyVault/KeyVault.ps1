Login-AzureRmAccount
Get-AzureRmSubscription
Set-AzureRmContext -SubscriptionName "MS MSDN2"
$vaultName = "keyvaultsetspntest"
$certificateName = "StsContosoLabBeEuOrg"
#Set-AzureRmKeyVaultAccessPolicy -VaultName $vaultName -UserPrincipalName "thovuy@microsoft.com" -PermissionsToCertificates all
$securepfxpwd = ConvertTo-SecureString –String "Admin@Azure01" –AsPlainText –Force
$cer = Import-AzureKeyVaultCertificate -VaultName $vaultName -Name $certificateName -FilePath "C:\Users\Thomas\Downloads\sts_contosolab_be_eu_org.pfx" -Password $securepfxpwd