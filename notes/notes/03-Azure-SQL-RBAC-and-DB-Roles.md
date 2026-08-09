# Azure SQL RBAC and Database Roles

## Overview

Azure SQL security uses multiple authorization layers.

Two important permission models are:

1. Azure Role-Based Access Control (RBAC)
2. SQL Database Roles

These two layers are different and should not be confused.

---

## Azure RBAC

Azure RBAC controls access to Azure resources.

It determines what a user, group, service principal, or managed identity can do with an Azure resource.

Examples of Azure RBAC roles include:

- Reader
- Contributor
- Owner

### Reader Role

The Reader role allows a principal to view Azure resources.

It does not normally allow the principal to make changes to those resources.

Example:

```text
Managed Identity
       |
       v
Azure RBAC
       |
       +---- Reader
       |
       v
Azure SQL Resource
