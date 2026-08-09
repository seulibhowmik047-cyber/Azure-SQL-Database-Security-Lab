# Azure SQL Database Basics

## Overview

Azure SQL is a family of fully managed relational database services provided by Microsoft Azure.

Azure SQL can be used to store, manage, and process application data without managing the underlying database infrastructure in the same way as an on-premises SQL Server.

## Main Azure SQL Services

### 1. Azure SQL Database

Azure SQL Database is a fully managed, cloud-based relational database service.

It is suitable for modern cloud applications where Microsoft manages most of the underlying infrastructure, maintenance, patching, and availability.

### 2. Azure SQL Managed Instance

Azure SQL Managed Instance is a fully managed SQL Server instance in Azure.

It provides high compatibility with SQL Server workloads and is useful when migrating existing on-premises SQL Server applications to Azure.

## SQL Server and Database Relationship

A SQL Server can host multiple databases.

```text
SQL Server
    |
    +-- Database A
    |
    +-- Database B
    |
    +-- Database C
