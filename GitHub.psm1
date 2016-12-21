Function Copy-GitHubItem {

<#
    .Synopsis
        Downloads a file from GitHub

    .Link
        http://stackoverflow.com/questions/16597874/powershell-retrieve-file-from-github
#>

    [CmdletBinding()]
    Param (
        [String]$Url,

        [PSCredential]$Credential
    )

    Begin {
        # ----- Make the connection to GitHub
        $WebClient = New-Object -TypeName System.Net.WebClient
        $WebClient.Credentials = New-Object -TypeName System.Net.NetworkCredential $Credential.UserName,$Credential.GetNetworkCredential().Password 
    }

    Process {
        # ----- Download 
        invoke-expression ($Webclient.DownloadString($Url))
    }
}

