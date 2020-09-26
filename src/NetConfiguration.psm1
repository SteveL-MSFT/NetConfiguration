function Get-NetInterface {
    [CmdletBinding(DefaultParameterSetName='name')]
    param(
        [Parameter(ParameterSetName='index', Mandatory=$false)]
        [ArgumentCompleter({
            param(
                $commandName,
                $parameterName,
                $wordToComplete,
                $commandAst,
                $fakeBoundParameters
            )
            (Get-NetInterface).Index | Where-Object { $_ -like "$wordToComplete*" } 
        })]
        [int]
        $Index,

        [Parameter(ParameterSetName='name', Mandatory=$false, Position=0, ValueFromPipelineByPropertyName)]
        [ArgumentCompleter({
            param(
                $commandName,
                $parameterName,
                $wordToComplete,
                $commandAst,
                $fakeBoundParameters
            )
        
            (Get-NetInterface).Name | Where-Object { $_ -like "$wordToComplete*" } 
        })]
        [string]
        $Name
    )

    $interfaces = [System.Net.NetworkInformation.NetworkInterface]::GetAllNetworkInterfaces()
    if ($Index) {
        $interfaces | Where-Object { $_.Index -eq $Index }
    }
    elseif ($Name) {
        $interfaces | Where-Object { $_.Name -eq $Name }
    }
    else {
        $interfaces
    }
}

function Resolve-Dns {
    [CmdletBinding()]
    param(
        [string] $Name
    )

    [System.Net.Dns]::Resolve($Name)
}
