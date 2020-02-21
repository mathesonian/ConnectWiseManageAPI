$CWMServer = 'https://staging.connectwisedev.com/'
$Verbose = @{}
if($env:APPVEYOR_REPO_BRANCH -and $env:APPVEYOR_REPO_BRANCH -notlike "master")
{
    $Verbose.add("Verbose",$True)
}

$PSVersion = $PSVersionTable.PSVersion.Major
Import-Module $PSScriptRoot\..\ConnectWiseManageAPI\ConnectWiseManageAPI.psm1 -Force

#Integration test example
Describe "Connect-CWM  PS$PSVersion Integrations tests" {

    Context 'Strict mode' { 

        Set-StrictMode -Version latest
        It 'Authentication: API Member Only' {
            try {
                $CWMConnectionInfo = @{
                    Server = $CWMServer
                    Company = $env:CWMCompany
                    pubkey = $env:CWMAPIMemberPub
                    privatekey = $env:CWMAPIMemberPriv
                    clientid = $env:CWMClientID
                }

                Connect-CWM @CWMConnectionInfo -Force -ErrorAction Stop
                $Connected = $true                   
            }
            catch {
                $Connected = $false 
            }
            $Connected | Should -Be $true
        }
        It 'Authentication: Member Impersonation' {
            try {
                $CWMConnectionInfo = @{
                    Server = $CWMServer
                    IntegratorUser = $env:CWMAPIMemberPub
                    IntegratorPass = $env:CWMAPIMemberPriv
                    Company = $env:CWMCompany
                    MemberID = $env:CWMUserName
                    clientid = $env:CWMClientID
                }
                
                Connect-CWM @CWMConnectionInfo -Force -ErrorAction Stop
                $Connected = $true                   
            }
            catch {
                $Connected = $false 
            }
            $Connected | Should -Be $true
        }
        It 'Authentication: My Account' {
            try {
                $CWMConnectionInfo = @{
                    Server = $CWMServer
                    Company = $env:CWMCompany
                    pubkey = $env:CWMPub
                    privatekey = $env:CWMPriv
                    clientid = $env:CWMClientID
                }
                Connect-CWM @CWMConnectionInfo -Force -ErrorAction Stop
                $Connected = $true                   
            }
            catch {
                $Connected = $false 
            }
            $Connected | Should -Be $true
        }
        It 'Authentication: Cookies!' {
            try {
                $Password = ConvertTo-SecureString -AsPlainText -Force $env:CWMUserPassword
                $Credentials = New-Object PSCredential $env:CWMUserName, $Password
                $CWMConnectionInfo = @{
                    Server = $CWMServer
                    Company = $env:CWMCompany
                    Credentials = $Credentials
                    clientid = $ClientID
                }
                Connect-CWM @CWMConnectionInfo -Force -ErrorAction Stop
                $Connected = $true                   
            }
            catch {
                $Connected = $false 
            }
            $Connected | Should -Be $true
        }
    }
}