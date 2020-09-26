@{
    RootModule = 'NetConfiguration.psm1'
    ModuleVersion = '0.0.1'
    CompatiblePSEditions = 'Core', 'Desktop'
    GUID = 'a572234b-f01c-465f-a333-8b6966a912b2'
    Author = 'Steve Lee'
    CompanyName = 'Microsoft Corporation'
    Copyright = '(c) Microsoft Corporation'
    Description = 'Manage local network configuration'

    # Minimum version of the PowerShell engine required by this module
    # PowerShellVersion = ''

    FormatsToProcess = 'NetConfiguration.Format.ps1xml'
    FunctionsToExport = 'Get-NetInterface', 'Resolve-Dns'
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    DscResourcesToExport = @()
    PrivateData = @{
        PSData = @{

            Tags = @('Windows','Linux','macOS')
            LicenseUri = 'https://github.com/SteveL-MSFT/NetConfiguration/blob/master/LICENSE'
            ProjectUri = 'https://github.com/SteveL-MSFT/NetConfiguration'
            ReleaseNotes = 'Initial preview'
            Prerelease = 'Preview1'
        }
    }
}
