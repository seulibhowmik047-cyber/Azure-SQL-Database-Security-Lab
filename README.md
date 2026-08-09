# Azure SQL Database Security Lab

A practical Azure security lab focused on securing Azure SQL databases using Microsoft Entra ID, RBAC, Firewall, Private Endpoint, Auditing, Encryption, Microsoft Defender for Cloud, Microsoft Sentinel, Dynamic Data Masking, and Always Encrypted.

---

## 📌 Overview

Azure SQL Database is a fully managed relational database service provided by Microsoft Azure.

Because databases store sensitive business and customer information, they must be protected against:

- Unauthorized access
- Credential theft
- Network attacks
- SQL injection
- Brute-force attacks
- Data theft
- Data exfiltration
- Excessive permissions
- Misconfiguration

This project demonstrates a defense-in-depth approach for securing Azure SQL databases.

---

# 🎯 Objectives

The main objectives of this lab are:

1. Understand Azure SQL Database security.
2. Understand Azure SQL Managed Instance.
3. Configure Microsoft Entra ID authentication.
4. Understand SQL authentication risks.
5. Configure managed identities.
6. Configure Azure RBAC.
7. Create database users and roles.
8. Configure Azure SQL Firewall.
9. Configure Private Endpoint.
10. Understand network isolation.
11. Enable Azure SQL Auditing.
12. Send logs to Log Analytics.
13. Understand Microsoft Sentinel integration.
14. Understand Microsoft Defender for Cloud.
15. Protect data at rest with TDE.
16. Protect data in transit with TLS.
17. Understand Dynamic Data Masking.
18. Understand Always Encrypted.
19. Apply least-privilege access.
20. Implement defense-in-depth security.

---

# 🔐 Security Architecture

```text
                         Users
                           |
                           v
                   Microsoft Entra ID
                           |
                           v
                          MFA
                           |
                           v
                  Conditional Access
                           |
                           v
                      Application
                           |
                           v
                    Managed Identity
                           |
                           v
                    Virtual Network
                           |
                           v
                   Private Endpoint
                           |
                           v
                  Azure SQL Database
                           |
          +----------------+----------------+
          |                |                |
          v                v                v
         RBAC             TDE              TLS
          |                |                |
          +----------------+----------------+
                           |
                           v
                    SQL Auditing
                           |
                           v
                  Log Analytics
                           |
              +------------+------------+
              |                         |
              v                         v
      Defender for Cloud        Microsoft Sentinel
              |                         |
              +------------+------------+
                           |
                           v
                   Security Monitoring
                           |
                           v
                    Incident Response
