# Azure SQL Firewall

## Overview

Azure SQL Firewall controls which network connections are allowed to reach an Azure SQL server.

Firewall rules provide an important network security layer for Azure SQL Database.

The firewall can restrict access based on IP addresses and network configuration.

---

# Azure SQL Firewall Levels

Azure SQL Database provides two important firewall rule levels:

1. Server-level firewall rules
2. Database-level firewall rules

---

# 1. Server-Level Firewall Rules

A server-level firewall rule applies to all databases hosted on the Azure SQL logical server.

```text
Azure SQL Server
       |
       +-- Database A
       |
       +-- Database B
       |
       +-- Database C

Server Firewall Rule
       |
       +-- Applies to Database A
       +-- Applies to Database B
       +-- Applies to Database C
