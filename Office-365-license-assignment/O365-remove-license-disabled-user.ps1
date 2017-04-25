# O365-remove-license-disabled-user
# This Script query disabled users with Office 365 license and remove the license.
#
# Jesse Reppin (C) - 2017
# V1.0 - First Release
#
# CHANGES
# 
#NOTE - Connect to the MSOL Service
Connect-MsolService

#Note - Attriutes
$ASID = "TENANTNAME:ENTERPRISEPACK"
$UL = "DE"

#NOTE - User Query with attributes
Get-MsolUser -EnabledFilter DisabledOnly | where-object {$_.isLicensed -eq "TRUE"} | Select-Object -ExpandProperty Userprincipalname | Out-File C:\Temp\disabledusers.txt

sleep -Seconds 10

$Users = Get-Content c:\temp\disabledusers.txt
    foreach ($user in $users)
    {
        $user
            Set-MsolUserLicense -UserPrincipalName $user -RemoveLicenses $ASID
        sleep -Seconds 10
    }