# Azure SQL Auditing Check
# Purpose: Check Azure SQL Server auditing configuration
# This script is intended for learning and lab purposes.

param (
    [Parameter(Mandatory = $true)]
    [string]$ResourceGroupName,

    [Parameter(Mandatory = $true)]
    [string]$ServerName
)

Write-Host "============================================"
Write-Host " Azure SQL Auditing Check"
Write-Host "============================================"

Write-Host ""
Write-Host "Resource Group : $ResourceGroupName"
Write-Host "SQL Server     : $ServerName"
Write-Host ""

# Check Azure CLI login
Write-Host "[1] Checking Azure login..."

$account = az account show 2>$null

if (-not $account) {
    Write-Host "ERROR: You are not logged in to Azure."
    Write-Host "Run: az login"
    exit 1
}

Write-Host "Azure login: OK"

# Check SQL Server auditing policy
Write-Host ""
Write-Host "[2] Checking SQL auditing configuration..."

$auditing = az sql server audit-policy show `
    --resource-group $ResourceGroupName `
    --name $ServerName `
    -o json 2>$null

if (-not $auditing) {
    Write-Host "ERROR: Unable to retrieve auditing configuration."
    exit 1
}

$auditConfig = $auditing | ConvertFrom-Json

Write-Host ""
Write-Host "Auditing State : $($auditConfig.state)"
Write-Host "Retention Days : $($auditConfig.retentionDays)"

# Check auditing status
Write-Host ""

if ($auditConfig.state -eq "Enabled") {
    Write-Host "PASS: Azure SQL Auditing is enabled."
}
else {
    Write-Host "WARNING: Azure SQL Auditing is disabled."
}

# Check storage destination
Write-Host ""
Write-Host "[3] Checking audit storage configuration..."

if ($auditConfig.storageEndpoint) {
    Write-Host "Storage Endpoint:"
    Write-Host $auditConfig.storageEndpoint
}
else {
    Write-Host "Storage account destination is not configured."
}

# Security recommendations
Write-Host ""
Write-Host "============================================"
Write-Host " Auditing Review Completed"
Write-Host "============================================"

Write-Host ""
Write-Host "Security Recommendations:"
Write-Host "1. Enable Azure SQL Auditing."
Write-Host "2. Send logs to a secure destination."
Write-Host "3. Consider Log Analytics for centralized monitoring."
Write-Host "4. Consider Microsoft Sentinel for SIEM capabilities."
Write-Host "5. Configure appropriate log retention."
Write-Host "6. Review database activity regularly."
Write-Host ""
