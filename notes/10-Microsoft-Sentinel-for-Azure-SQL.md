# Microsoft Sentinel for Azure SQL

## Overview

Microsoft Sentinel is a cloud-native security information and event management (SIEM) and security orchestration, automation, and response (SOAR) solution.

It can collect security data from different sources and help security teams detect, investigate, and respond to threats.

For Azure SQL, audit and security-related logs can be collected and analyzed through Microsoft Sentinel.

---

# Why Microsoft Sentinel Is Useful

Azure SQL generates security and activity information.

Instead of examining individual logs manually, organizations can centralize security data and use Microsoft Sentinel for analysis.

```text
Azure SQL
    |
    v
Audit Logs
    |
    v
Log Analytics Workspace
    |
    v
Microsoft Sentinel
    |
    +---- Analytics Rules
    |
    +---- Alerts
    |
    +---- Incidents
    |
    +---- Investigation
    |
    +---- Response
