# Script to enable O365 Licenses to a list of user
Connect-MsolService

$ASID = "TENANTNAME:ENTERPRISEPACK"

$UL = "DE"

$LicenseOptions = New-MsolLicenseOptions -AccountSkuId TENANTNAME:ENTERPRISEPACK -DisabledPlans "EXCHANGE_S_ENTERPRISE","SHAREPOINTENTERPRISE","SHAREPOINTWAC","RMS_S_ENTERPRISE","POWERAPPS_O365_P2","Deskless","TEAMS1","PROJECTWORKMANAGEMENT","FLOW_O365_P2"

$Users = Get-Content c:\temp\users.txt
foreach ($user in $users)
{
$user

#New-MsolUserLicense -UserPrincipalName $user
Set-MsolUser -UserPrincipalName $user -UsageLocation $UL
sleep -Seconds 5
Set-MsolUserLicense -UserPrincipalName $user -AddLicenses $ASID
sleep -Seconds 5
Set-MsolUserLicense -UserPrincipalName $user -LicenseOptions $LicenseOptions
}
