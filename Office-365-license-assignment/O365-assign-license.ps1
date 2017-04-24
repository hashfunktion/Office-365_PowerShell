# Script to enable O365 Licenses to a list of user, that is create with O365-user-query.ps1
# !- Run first --> O365-user-query.ps1 to create the userlist! -!
#
# Jesse Reppin (C) - 2017
# V1.0 - First Release
#
# Options to edit:
#   Replace "TENANTNAME" with your TENANTNAME.
#   Replace "ENTERPRISEPACK" with your type of license
#   Replace "DE" with your locals
#   Edit -DisabledPlans to chance the plans that should be disabled
#

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
