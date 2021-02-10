Packets Loss Check
======

**Description:**

We check if there are any `PacketsReceivedDiscarded` logged for the NIC. Large package loss can cause a performance impact on a system and should be investigated and fixed.

- Good: `PacketsReceivedDiscarded` is `0`
- Warning: `PacketsReceivedDiscarded` lower than `1000`
- Error: `PacketsReceivedDiscarded` greater than `1000`

***NOTE:*** This counter is accumulation from reboot, or if the NIC setting was changed, so the counter can be stale for some time. However, even though you might not be actively dropping packets, the counter should be at 0 in a healthy environment.

**Included in HTML Report?**

Yes

**Additional Information**

- https://kb.vmware.com/s/article/2039495