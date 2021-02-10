IPv6 Enabled Check
======

**Description:**

We check if IPv6 is enabled or not. If we determine that IPv6 has been disabled, we check to see if it's fully disabled as recommended. We determine if the IPv6 is fully disabled by checking to see if we have an IPv6 Address available on the NIC and that it matches what is found in the registry at `SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters\DisabledComponents`.

If both places don't have IPv6 enabled/disabled properly a warning is thrown. This can cause communication issues if not properly disabled.

**Included in HTML Report?**

Yes

**Additional resources:**

https://docs.microsoft.com/en-us/archive/blogs/rmilne/disabling-ipv6-and-exchange-going-all-the-way

https://support.microsoft.com/en-us/help/929852/guidance-for-configuring-ipv6-in-windows-for-advanced-users