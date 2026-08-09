# Azure SQL Data Protection: Dynamic Data Masking and Always Encrypted

## Overview

Azure SQL provides different mechanisms to protect sensitive information stored in databases.

Two important data protection features are:

- Dynamic Data Masking
- Always Encrypted

These controls help reduce the risk of exposing sensitive information to unauthorized users.

---

# Dynamic Data Masking

Dynamic Data Masking (DDM) limits the exposure of sensitive data by masking the returned value for users who do not need to see the original information.

Examples of sensitive information include:

- Credit card numbers
- Phone numbers
- Email addresses
- National identification numbers
- Financial information
- Other sensitive customer information

---

# Why Dynamic Data Masking Is Useful

Consider a banking application.

A customer-service representative may need to verify a customer's account, but they may not need to see the complete debit card or other sensitive information.

Instead of showing the complete value, the application can return a masked value.

Example:

```text
Actual Value:

4532123412345678

Masked Value:

XXXX-XXXX-XXXX-5678
