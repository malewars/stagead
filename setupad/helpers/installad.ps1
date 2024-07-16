Import-Module ServerManager
Install-windowsfeature -name AD-Domain-Services –IncludeManagementTools
Get-command –module ADDSDeployment
Install-ADDSForest –domainname “Staged”
