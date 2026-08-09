# Azure SQL Encryption and TLS

## Overview

Encryption protects Azure SQL data from unauthorized access.

Azure SQL security uses encryption for:

- Data at rest
- Data in transit

Two important technologies are:

1. Transparent Data Encryption (TDE)
2. Transport Layer Security (TLS)

---

# Data at Rest

Data at rest means data that is stored on disk or in persistent storage.

Examples include:

- Database files
- Database records
- Backups
- Transaction logs

Azure SQL uses Transparent Data Encryption (TDE) to help protect data at rest.

```text
Azure SQL Database
       |
       v
Data Stored on Disk
       |
       v
Transparent Data Encryption
       |
       v
Encrypted Data
