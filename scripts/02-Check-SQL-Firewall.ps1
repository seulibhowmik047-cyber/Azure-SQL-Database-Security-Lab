# Azure SQL Firewall Security Check
# Purpose: Review Azure SQL Server firewall rules
# This script is intended for learning and lab purposes.

param (
    [Parameter(Mandatory = $true)]
    [string]$ResourceGroupName,

    [Parameter(Mandatory = $true)]
    [string]$ServerName
)

Write-Host "============================================"
Write-Host " Azure SQL Firewall Security Check"
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

# Retrieve firewall rules
Write-Host ""
Write-Host "[2] Retrieving Azure SQL firewall rules..."

$firewallRules = az sql server firewall-rule list `
    --resource-group $ResourceGroupName `
    --server $ServerName `
    -o json 2>$null

if (-not $firewallRules) {
    Write-Host "ERROR: Unable to retrieve firewall rules."
    exit 1
}

$rules = $firewallRules | ConvertFrom-Json

Write-Host ""
Write-Host "Firewall Rules Found: $($rules.Count)"

# Display firewall rules
foreach ($rule in $rules) {

    Write-Host ""
    Write-Host "--------------------------------------------"
    Write-Host "Rule Name : $($rule.name)"
    Write-Host "Start IP  : $($rule.startIpAddress)"
    Write-Host "End IP    : $($rule.endIpAddress)"
    Write-Host "--------------------------------------------"

    # Check for broad Internet access
    if (
        $rule.startIpAddress -eq "0.0.0.0" -and
        $rule.endIpAddress -eq "0.0.0.0"
    ) {
        Write-Host "WARNING: Azure services access rule detected."
    }

    if (
        $rule.startIpAddress -eq "0.0.0.0" -and
        $rule.endIpAddress -eq "255.255.255.255"
    ) {
        Write-Host "CRITICAL: Firewall rule allows all IPv4 addresses."
    }
}

Write-Host ""
Write-Host "============================================"
Write-Host " Firewall Review Completed"
Write-Host "============================================"

Write-Host ""
Write-Host "Security Recommendations:"
Write-Host "1. Allow only trusted IP addresses."
Write-Host "2. Avoid broad IP ranges."
Write-Host "3. Review firewall rules regularly."
Write-Host "4. Prefer Private Endpoint for sensitive workloads."
Write-Host "5. Disable public network access when appropriate."
Write-Host ""
