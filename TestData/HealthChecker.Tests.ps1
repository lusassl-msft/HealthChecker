$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
$here = $here.Replace("\TestData", "")
. "$here\$sut"


Describe "Testing Get-OperatingSystemVersion" {
    
    Context "Good Testing Results" {
        It "Windows 2008" {
            Get-OperatingSystemVersion "6.0.6000" | Should Be Windows2008
        }
        It "Windows 2008 R2 v1" {
            Get-OperatingSystemVersion "6.1.7600" | Should Be Windows2008R2
        }
        It "Windows 2008 R2 v2" {
            Get-OperatingSystemVersion "6.1.7601" | Should Be Windows2008R2
        }
        It "Windows 2012" {
            Get-OperatingSystemVersion "6.2.9200" | Should Be Windows2012
        }
        It "Windows 2012 R2" {
            Get-OperatingSystemVersion "6.3.9600" | Should Be Windows2012R2
        }
        It "Windows 2016" {
            Get-OperatingSystemVersion "10.0.14393" | Should Be Windows2016
        }
    }
    Context "Bad Testing Results" {
        It "Default" {
            Get-OperatingSystemVersion "10.0.143" | Should Be Unknown
        }
    }
}

Describe "Testing Get-ServerType" {
    Context "Good Testing Results" {
        It "VMware Test" {
            Get-ServerType "VMWare Test" | Should Be VMWare
        }
        It "Hyper-V Test" {
            Get-ServerType "Hello Microsoft Corporation" | Should Be HyperV
        }
        It "Physical Test" {
            Get-ServerType "Physical Test" | Should Be Physical
        }
    }
}