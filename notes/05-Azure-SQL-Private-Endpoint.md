# Azure SQL Private Endpoint and Network Isolation

## Overview

Network isolation is an important part of securing Azure SQL Database.

A database that is directly exposed through a public endpoint can have a larger attack surface.

For sensitive workloads, Azure Private Endpoint can provide private connectivity between a Virtual Network and Azure SQL.

---

## Why Network Isolation Is Important

Consider a sensitive organization such as a banking environment.

A database exposed through a public endpoint may be reachable from the Internet.

```text
Internet
    |
    v
Public Endpoint
    |
    v
Azure SQL Database
