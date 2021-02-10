Certificate Check
======

**Description**:

This check retrieves all certificates from the Exchange server by using the `Get-ExchangeCertificate` cmdlet. We display the following information:
- FriendlyName
- Thumbprint
- Lifetime in days
- Key size
- Bound to services
- Current Auth Certificate
- SAN Certificate
- Namespaces

We also perform the following checks:

- Certificate Lifetime check:
We display a green information, if the certificate is valid for 60 or more days.
We show a yellow warning, if the certificate lifetime is between 30 and 59 days.
If the lifetime is < 30 days, we show a red error message.

- Weak key size check:
We show a red warning, if the key size is lower than 2048 bit.

- Valid Auth Certificate check:
We check if the certificate which is set as current Auth certificate is available on the server.

**Included in HTML Report?**

Yes