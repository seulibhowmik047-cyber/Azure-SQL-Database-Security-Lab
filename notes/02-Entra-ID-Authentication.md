# Microsoft Entra ID Authentication for Azure SQL

## Overview

Microsoft Entra ID authentication provides an identity-based authentication method for Azure SQL Database.

It can reduce the need to store SQL usernames and passwords inside application configuration files or connection strings.

## Azure SQL Authentication Methods

Azure SQL can use different authentication approaches:

1. SQL Authentication
2. Microsoft Entra ID Authentication
3. A combination of authentication methods when required by the organization

For sensitive workloads, identity-based authentication should be preferred when the application and environment support it.

---

## SQL Authentication

SQL Authentication uses a SQL username and password.

```text
Application
    |
    | Username + Password
    v
Azure SQL Database
