<############################################################################################

PoshHub

Milesstones

############################################################################################>

function Get-GithubMilestones{
    Param(
        [Parameter (Mandatory=$True)] [string] $Account = $(throw "Please specify required Github Account with -Account parameter"),
        [Parameter (Mandatory=$True)] [string] $Repo    = $(throw "Please specify required Repository Name with the -Repo paramter"),
        [Parameter (Mandatory=$False)][string] $State   = "open",
        [Parameter (Mandatory=$False)][string] $Sort   = "due_date",
        [Parameter (Mandatory=$False)][string] $direction = "asc"
    )

    Get-GithubAccount($Account)

    try {

        $pair = "$($Credentials.AccountName):$($Credentials.Password)"

        $encodedCreds = [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes($pair))

        $basicAuthValue = "Basic $encodedCreds"

        $Headers = @{
            Authorization = $basicAuthValue
            }


        $url = "https://api.github.com/repos/$($Credentials.AccountName)/$Repo/milestones"

        $RestMethodBody = "{""state"":""$State"",""sort"":""$sort"",""direction"":""$direction""}"
        Write-Host $RestMethodBody

#        Invoke-RestMethod -Uri $url -Headers $Headers -Body $RestMethodBody -Method Get 
        Invoke-WebRequest -Uri $url -Headers $Headers -Body $RestMethodBody -Method Get

        } 
        catch {
        Invoke-Exception($_.Exception)
        }
<#
 .SYNOPSIS
 Bulk delete of objects in containers.

 .DESCRIPTION
 The Remove-CloudFilesObjects cmdlet allows you to bulk delete multiple objects in multiple containers.
 
 .PARAMETER Account
 Use this parameter to indicate which account you would like to execute this request against. 
 Valid choices are defined in PoshStack configuration file.

 .PARAMETER ContainerName
 The unique identifier of the container.

 .PARAMETER Headers
 The metadata for this container:
 X-Container-Meta-name (Optional)
 Custom container metadata. Replace name at the end of the header with the name for your metadata.

 X-Container-Read (Optional)
 Sets an access control list (ACL) that grants read access. This header can contain a comma-delimited list of users that can read the container (allows the GET method for all objects in the container).

 X-Container-Write (Optional)
 Sets an ACL that grants write access. This header can contain a comma-delimited list of users that can write to the container (allows PUT, POST, COPY, and DELETE methods for all objects in the container).

 X-Versions-Location (Optional)
 Enables versioning on this container. The value is the name of another container. You must UTF-8-encode and then URL-encode the name before you include it in the header. To disable versioning, set the header to an empty string.

 .PARAMETER UseInternalUrl
 Use the endpoint internal URL instead of the endpoint Public URL. 

 .PARAMETER RegionOverride
 This parameter will temporarily override the default region set in PoshStack configuration file. 

 .EXAMPLE
 PS C:\Users\Administrator> New-CloudFileContainer -Account demo -ContainerName "MyTestContainer"
 This example will create the container "MyTestContainer" in the default region for the account "demo".

 .LINK
 http://docs.rackspace.com/files/api/v1/cf-devguide/content/PUT_createcontainer_v1__account___container__containerServicesOperations_d1e000.html
#>
}


function New-GithubMilestone{
    Param(
        [Parameter (Mandatory=$True)] [string] $Account = $(throw "Please specify required Github Account with -Account parameter"),
        [Parameter (Mandatory=$True)] [string] $Repo    = $(throw "Please specify required Repository Name with the -Repo paramter"),
        [Parameter (Mandatory=$True)] [string] $Title   = $(throw "Please specify required Issue Title with the -Title parameter"),
        [Parameter (Mandatory=$False)][string] $State   = "open",
        [Parameter (Mandatory=$False)][string] $Description,
        [Parameter (Mandatory=$False)][datetime] $due_on
    )

    Get-GithubAccount($Account)

    try {

        $pair = "$($Credentials.AccountName):$($Credentials.Password)"

        $encodedCreds = [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes($pair))

        $basicAuthValue = "Basic $encodedCreds"

        $Headers = @{
            Authorization = $basicAuthValue
            }


        $url = "https://api.github.com/repos/$($Credentials.AccountName)/$Repo/milestones"

        $RestMethodBody = "{""title"":""$Title"",""state"":""$State"",""description"":""$Description""}"

        Invoke-RestMethod -Uri $url -Headers $Headers -Body $RestMethodBody -Method Post
        } 
        catch {
        Invoke-Exception($_.Exception)
        }
<#
 .SYNOPSIS
 Bulk delete of objects in containers.

 .DESCRIPTION
 The Remove-CloudFilesObjects cmdlet allows you to bulk delete multiple objects in multiple containers.
 
 .PARAMETER Account
 Use this parameter to indicate which account you would like to execute this request against. 
 Valid choices are defined in PoshStack configuration file.

 .PARAMETER ContainerName
 The unique identifier of the container.

 .PARAMETER Headers
 The metadata for this container:
 X-Container-Meta-name (Optional)
 Custom container metadata. Replace name at the end of the header with the name for your metadata.

 X-Container-Read (Optional)
 Sets an access control list (ACL) that grants read access. This header can contain a comma-delimited list of users that can read the container (allows the GET method for all objects in the container).

 X-Container-Write (Optional)
 Sets an ACL that grants write access. This header can contain a comma-delimited list of users that can write to the container (allows PUT, POST, COPY, and DELETE methods for all objects in the container).

 X-Versions-Location (Optional)
 Enables versioning on this container. The value is the name of another container. You must UTF-8-encode and then URL-encode the name before you include it in the header. To disable versioning, set the header to an empty string.

 .PARAMETER UseInternalUrl
 Use the endpoint internal URL instead of the endpoint Public URL. 

 .PARAMETER RegionOverride
 This parameter will temporarily override the default region set in PoshStack configuration file. 

 .EXAMPLE
 PS C:\Users\Administrator> New-CloudFileContainer -Account demo -ContainerName "MyTestContainer"
 This example will create the container "MyTestContainer" in the default region for the account "demo".

 .LINK
 http://docs.rackspace.com/files/api/v1/cf-devguide/content/PUT_createcontainer_v1__account___container__containerServicesOperations_d1e000.html
#>
}
