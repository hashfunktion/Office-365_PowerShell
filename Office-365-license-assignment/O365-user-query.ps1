#Get User with atributes
Connect-MsolService
Get-MsolUser -EnabledFilter EnabledOnly -ALL | where-object {$_.isLicensed -ne "TRUE" -and $_.City -like "CITY-NAME"} | Select-Object Userprincipalname | Out-File C:\Temp\users.txt
