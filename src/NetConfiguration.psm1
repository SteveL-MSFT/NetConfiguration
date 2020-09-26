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

            $quote = ""
            if ($wordToComplete.StartsWith("'")) {
                $quote = "'"
            }
            elseif ($wordToComplete.StartsWith('"')) {
                $quote = '"'
            }

            if ($wordToComplete.EndsWith("'") -or $wordToComplete.EndsWith('"')) {
                $wordToComplete = $wordToComplete.Substring(0, $wordToComplete.Length - 1)
            }

            $result = (Get-NetInterface).Index | Where-Object { "$quote$_$quote" -like "$wordToComplete*" }
            $results | ForEach-Object {
                if ($_.Contains(' ')) {
                    "'$_'"
                }
            }
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

            $quote = ""
            if ($wordToComplete.StartsWith("'")) {
                $quote = "'"
            }
            elseif ($wordToComplete.StartsWith('"')) {
                $quote = '"'
            }

            if ($wordToComplete.EndsWith("'") -or $wordToComplete.EndsWith('"')) {
                $wordToComplete = $wordToComplete.Substring(0, $wordToComplete.Length - 1)
            }

            $results = (Get-NetInterface).Name | Where-Object { "$quote$_$quote" -like "$wordToComplete*" }
            $results | ForEach-Object {
                if ($_.Contains(' ')) {
                    "'$_'"
                }
            }
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
