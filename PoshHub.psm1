<############################################################################################

PoshHub


############################################################################################>

# Github account configuration file
$Global:PoshHubConfigFile = $env:USERPROFILE + "\Documents\WindowsPowerShell\Modules\PoshHub\GithubAccounts.csv" 

############################################################################################
#
# Shared functions for use within module cmdlets. 
#
############################################################################################

function Get-GithubAccount {
    <#
    Read $Global:PoshHubConfigFile then populate global account variables 
    based on value of $Global:account
    #>

    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$True)][string] $account = $(throw "Please specify required Github Account with -account parameter")
    )

    try {
        # Search $ConfigFile file for $account entry and populate temporary $conf with relevant details
        $Global:Credentials = Import-Csv $PoshHubConfigFile | Where-Object {$_.AccountName -eq $Account}
        
        # Raise exception if specified $account is not found in conf file
        if ($Credentials.AccountName -eq $null) {
            throw "Get-GithubAccount: `"$account`" account is not defined in the configuration file"
        }

    }
    catch {
        Invoke-Exception($_.Exception)
    }

}
function Invoke-Exception {
    write-host "`nCaught an exception: $($_.Exception.Message)" -ForegroundColor Red
    write-host "Exception Type: $($_.Exception.GetType().FullName) `n" -ForegroundColor Red
    break;
}

function Show-UntestedWarning {
    Write-Host "`nWarning: This cmdlet is untested - if you proceed and find stuff not working, please provide feedback to the developers`n" -ForegroundColor Yellow
    $okToContinue = Read-Host "Are you happy to continue? (type `"yes`" to continue)"
    if ($okToContinue -ne "yes")
    {
        Write-Host "`n --- You didn't enter yes - quitting`n`n"
        break;
    }
    else
    {
        Write-Host "`n --- Excellent, hang-on to your...`n"
    }
}

function Show-GithubAccounts {
    Import-Csv $Global:PoshHubConfigFile | ft -AutoSize

<#
 .SYNOPSIS
 Display all configured Github accounts that are avaialble to use.

 .DESCRIPTION
 The Show-GithubAccounts cmdlet will simply display a list of all Github accounts, which have been configured in the $Global:PoshGithubConfigFile.
 
 .EXAMPLE
 PS H:\> Show-GithubAccounts

 AccountName Password
 ----------- --------
 foo         password
 bar         123456
 
#>
}
