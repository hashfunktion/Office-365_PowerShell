# Script to query users to apply Office 365 licenses.
# 
# Jesse Reppin (C) - 2017
# V1.0 - First Release
#
# Options:
#   -EnabledFilter EnabledOnly --> The script query only enabled user
#   $_.isLicensed -ne "TRUE" --> The script query only user without Office 365 license
#
Connect-MsolService
Get-MsolUser -EnabledFilter EnabledOnly -ALL | where-object {$_.isLicensed -ne "TRUE" -and $_.City -like "CITY-NAME"} | Select-Object Userprincipalname | Out-File C:\Temp\users.txt
