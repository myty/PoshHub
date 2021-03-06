<############################################################################################

PoshHub Module Manifest 

        
Description
-----------
PowerShell client for Github APIs

############################################################################################>

@{

RootModule = 'PoshHub.psm1'
ModuleVersion = '1.0.0'
Author = 'don.schenck@gmail.com'
Copyright = ''
Description = "PowerShell client for GitHub APIs"
PowerShellVersion = '4.0'
PowerShellHostVersion = '4.0'
 ScriptsToProcess = @(
"PoshHub-Init.ps1",
"PoshHub-Issues.ps1"
"PoshHub-Milestones.ps1"
)
FunctionsToExport = '*'
CmdletsToExport = '*'
VariablesToExport = '*'
AliasesToExport = '*'
}

