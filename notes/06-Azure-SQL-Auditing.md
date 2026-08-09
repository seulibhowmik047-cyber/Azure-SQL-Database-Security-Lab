# Azure SQL Auditing and Monitoring

## Overview

Azure SQL Auditing records database activities and events.

Auditing helps organizations monitor database activity, investigate suspicious behavior, support compliance requirements, and maintain security visibility.

Azure SQL audit logs can be sent to different destinations depending on the organization's monitoring and security requirements.

---

# Why Azure SQL Auditing Is Important

Database auditing helps answer questions such as:

- Who accessed the database?
- Which database activity occurred?
- When did the activity happen?
- Which queries or actions were performed?
- Where did the activity originate?
- Was there suspicious database activity?
- Can the activity be investigated later?

Without auditing, it becomes much harder to investigate database-related security incidents.

---

# Azure SQL Auditing Architecture

```text
Azure SQL Database
        |
        v
   SQL Auditing
        |
        +-------------------+
        |         |         |
        v         v         v
 Log Analytics  Storage   Event Hub
 Workspace      Account
        |
        v
 Microsoft Sentinel
        |
        v
 Security Monitoring
