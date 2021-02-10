
Table of Contents
=================

<!-- toc -->
- [Exchange Information](#Exchange-Information)
    + [Exchange Server Maintenance Check](.\ExchangeInformation\ExchangeServerMaintenanceCheck.md)
    + [General Server Information](.\ExchangeInformation\GeneralServerInformation.md)
    + [MAPI Front End App Pool GC Mode](.\ExchangeInformation\MAPIFrontEndAppPoolGCModeCheck.md)
- [Exchange Web App Pools](.\ExchangeWebAppPools\WebAppPoolStatusInformation.md)
- [Frequent Configuration Issues](#Frequent-Configuration-Issues)
    + [Credential Guard](.\FrequentConfigurationIssues\CredentialGuardCheck.md)
    + [CTS Process Affinity](.\FrequentConfigurationIssues\CTSProcessorAffinityPercentageCheck.md)
    + [RPC Min Connection Timeout](.\FrequentConfigurationIssues\RPCMinConnectionTimeoutCheck.md)
    + [TCP IP Settings](.\FrequentConfigurationIssues\TCPIPSettingsCheck.md)
- [Hardware Information](#Hardware-Information)
    + [General Hardware Information](.\HardwareInformation\GeneralHardwareInformation.md)
    + [Hyper Threading](.\HardwareInformation\HyperThreadingCheck.md)
- [NIC Settings](#NIC-Settings)
    + [General NIC Information](.\NICSettings\GeneralNICInformation.md)
    + [IPv6 Enabled](.\NICSettings\IPv6EnabledCheck.md)
    + [Packet Loss](.\NICSettings\PacketsLossCheck.md)
    + [RSS Enabled](.\NICSettings\RSSEnabledCheck.md)
    + [Sleepy NIC](.\NICSettings\SleepyNICCheck.md)
- [OS Information](#OS-Information)
    + [General OS Information](.\OSInformation\GeneralOSInformation.md)
    + [NET Framework Supportability](.\OSInformation\NETFrameworkSupportabilityCheck.md)
    + [Page file Size](.\OSInformation\PagefileSizeCheck.md)
    + [Server Pending Reboot](.\OSInformation\ServerPendingRebootCheck.md)
    + [Visual C++ Redistributable Version](.\OSInformation\VisualCRedistributableVersionCheck.md)
- [Security Settings](#Security-Settings)
    + [Certificate Check](.\SecuritySettings\CertificateCheck.md)
    + [LM Compatibility Level Information](.\SecuritySettings\LMCompatibilityLevelInformationCheck.md)
    + [SMB v1](.\SecuritySettings\SMBv1Check.md)
    + [TLS Configuration](.\SecuritySettings\TLSConfigurationCheck.md)
    + [Vulnerability](SecuritySettings/VulnerabilityCheck.md)
<!-- tocstop -->

# Exchange Information

**Description:**

We show some general information about the Exchange server against which the script was executed.

- Server Name
- Exchange Version
- Exchange Build Number
- Cumulative Update Check (Not part of HTML Report)
We validate if the server is running an supported (**N-1**) Cumulative Update (CU) version.
- Exchange IU or Security Hotfix (Not part of HTML Report)
We show installed Exchange Interims Update (IU) or Security Updates (SU)
- Server Role
- Database Availability Group (DAG) in which the server is a member
- AD Site in which the server is located
- MAPI FrontEnd App Pool GC Server Mode - Exchange 2013 only
- MAPI/HTTP Organizational Status (Enabled/Disabled)
- [Maintenance State](.\ExchangeInformation\ExchangeServerMaintenanceCheck.md)

**Included in HTML Report?**

Most of them, yes

# Exchange Web App Pools

======

**Description:**

We display the following information for an Exchange server that is not an EdgeTransport server:
- App Pool Name
- GC Server Mode Enabled
- Status

**Included in HTML Report?**

No

# Frequent Configuration Issues

We show some general information about settings that are known to cause issues on the Exchange Server.

- [Credential Guard](.\FrequentConfigurationIssues\CredentialGuardCheck.md)
- [CTS Processor Affinity Percentage](.\FrequentConfigurationIssues\CTSProcessorAffinityPercentageCheck.md)
- [RPC Min Connection Timeout](.\FrequentConfigurationIssues\RPCMinConnectionTimeoutCheck.md)
- [TPC IP Settings](.\FrequentConfigurationIssues\TCPIPSettingsCheck.md)

# Hardware Information

**Description:**

We show some general information about the Processor/Hardware of the Exchange server against which the script was executed.

- Hardware Type - `VMware`, `AmazonEC2`, `HyperV`, `Physical`, and `Unknown` are the possible options
- Manufacturer (If Hardware type is `Physical` or `AmazonEC2`)
- Model (If Hardware type is `Physical` or `AmazonEC2`)
- Processor Name
- [Number of Processors](HardwareInformation/Processor.md#Number-Of-Processors)
- [Number of Physical Cores](.\HardwareInformation\Processor.md#Number-Of-Logical-and-Physical-Cores)
- [Number of Logical Cores](.\HardwareInformation\Processor.md#Number-Of-Logical-and-Physical-Cores)
- [Hyper-Threading](.\HardwareInformation\HyperThreadingCheck.md)
- [All Processor Cores Visible / NUMA Group Size Optimization](.\HardwareInformation\NumaBiosCheck.md)
- [Max Processor Speed](.\HardwareInformation\Processor.md#Max-Processor-Speed)
- Physical Memory - displays possible warning if not within specifications.

**Included in HTML Report?**

Yes

**Additional resources:**

- https://docs.microsoft.com/en-us/exchange/exchange-2013-sizing-and-configuration-recommendations-exchange-2013-help#exchange-2013-sizing

- https://docs.microsoft.com/en-us/exchange/plan-and-deploy/system-requirements?view=exchserver-2016#hardware-requirements-for-exchange-2016

- https://docs.microsoft.com/en-us/exchange/plan-and-deploy/system-requirements?view=exchserver-2019#hardware-requirements-for-exchange-2019

# NIC Settings

**Description:**

We show some general information for each `Network Interface Controller (NIC)` which is available within the Exchange server against which the script was executed.

- Interface Description
- Link Speed
- [IPv6 Enabled](.\NICSettings\IPv6EnabledCheck.md)
- IPv4 Address (Address, Subnet, Gateway)
- IPv6 Address (Address, Subnet, Gateway)
- DNS Server
- Registered In DNS
- [PnPCapabilities](.\NICSettings\SleepyNICCheck.md) - If not HyperV
- [Packets Received Discarded](.\NICSettings\PacketsLossCheck.md)

We query these settings by using the `Get-NetIPConfiguration` and `Get-DnsClient` cmdlet or in case of any issue we're doing a fallback using WMI class `Win32_NetworkAdapter` and `Win32_NetworkAdapterConfiguration`.

If the server is running `Windows 2012 R2` or higher, we can provide more details on the NIC:

- Driver Date - We show a warning if the NIC driver is older than 1 year
- Driver Version
- MTU Size
- [RSS] Max Processors
- [RSS] Max Processor Number
- [RSS] Number of Receive Queues
- [RSS] [Status (Enabled, Disabled, Not supported)](.\NICSettings\RSSEnabledCheck.md)

We query the RSS Settings by using the `Get-NetAdapterRss` cmdlet.

**Included in HTML Report?**

Yes

# OS Information

**Description:**

We show some general information about the Operating System (OS) of the Exchange server against which the script was executed.

- OS Version
- System Up Time (Not part of HTML Report)
- Time Zone (including DST Time Zone issue check)
- Dynamic Daylight Time status
- Power Plan - We check if servers Power Plan is set to high performance (recommended)
- Http Proxy Setting - We check if a Win Http Proxy is set on the Exchange server (this can cause client connectivity issues)
- [.NET Framework Version](.\OSInformation\NETFrameworkSupportabilityCheck.md)
- [Visual C++ Redistributable Version](.\OSInformation\VisualCRedistributableVersionCheck.md)
- [Pagefile Size](.\OSInformation\PagefileSizeCheck.md)
- [Server Pending Reboot](.OSInformation\ServerPendingRebootCheck.md)

**Included in HTML Report?**

Most of them, yes

# Security Settings

We show some configuration settings/updates that are import to help have a secure Exchange Server.

- [Exchange Certificates](.\SecuritySettings\CertificateCheck.md)
- [LM Compatibility Level](.\SecuritySettings\LMCompatibilityLevelInformationCheck.md)
- [SMBv1 disabled/removed](.\SecuritySettings\SMBv1Check.md)
- [TLS Configuration Settings](.\SecuritySettings\TLSConfigurationCheck.md)
- [Vulnerability/Updates](.\SecuritySettings\VulnerabilityCheck.md)