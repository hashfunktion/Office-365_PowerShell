# [Office 365 license assignment via PowerShell](h)

### Content
* O365-user-query.ps1 - Script to query users by Attributes
* O365-assign-license.ps1 - Script to assign the spezified users



#### Script options
* -DisabledPlans - Option to disable plans when you don´t wont aktivate all plans to the users
  * Via PowerShell to get aktive plans - Get-MsolAccountSku | Where-Object {$_.SkuPartNumber -eq "ENTERPRISEPACK"} | ForEach-Object {$_.ServiceStatus}
