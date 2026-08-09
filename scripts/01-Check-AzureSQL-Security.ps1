# Azure SQL Database Security Check
# Purpose: Basic security configuration review
# This script is intended for learning and lab purposes.

param (
    [Parameter(Mandatory = $true)]
    [string]$ResourceGroupName,

    [Parameter(Mandatory = $true)]
    [string]$ServerName,

    [Parameter(Mandatory = $true)]
    [string]$DatabaseName
)

Write-Host "============================================"
Write-Host " Azure SQL Database Security Check"
Write-Host "============================================"

Write-Host ""
Write-Host "Resource Group : $ResourceGroupName"
Write-Host "SQL Server     : $ServerName"
Write-Host "Database       : $DatabaseName"
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

# Check Azure SQL database
Write-Host ""
Write-Host "[2] Checking Azure SQL Database..."

$db = az sql db show `
    --resource-group $ResourceGroupName `
    --server $ServerName `
    --name $DatabaseName `
    2>$null

if (-not $db) {
    Write-Host "ERROR: Azure SQL Database was not found."
    exit 1
}

Write-Host "Database found: OK"

# Check SQL Server public network access
Write-Host ""
Write-Host "[3] Checking public network access..."

$server = az sql server show `
    --resource-group $ResourceGroupName `
    --name $ServerName `
    --query "{PublicNetworkAccess:publicNetworkAccess}" `
    -o json 2>$null

if ($server) {
    $serverInfo = $server | ConvertFrom-Json

    Write-Host "Public Network Access: $($serverInfo.PublicNetworkAccess)"

    if ($serverInfo.PublicNetworkAccess -eq "Disabled") {
        Write-Host "PASS: Public network access is disabled."
    }
    else {
        Write-Host "WARNING: Public network access is enabled."
    }
}

# Check TLS configuration
Write-Host ""
Write-Host "[4] Checking minimum TLS version..."

$tlsVersion = az sql server show `
    --resource-group $ResourceGroupName `
    --name $ServerName `
    --query "minimalTlsVersion" `
    -o tsv 2>$null

if ($tlsVersion) {
    Write-Host "Minimum TLS Version: $tlsVersion"

    if ($tlsVersion -ge "1.2") {
        Write-Host "PASS: TLS 1.2 or higher is configured."
    }
    else {
        Write-Host "WARNING: Review TLS configuration."
    }
}

# Check firewall rules
Write-Host ""
Write-Host "[5] Checking firewall rules..."

$firewallRules = az sql server firewall-rule list `
    --resource-group $ResourceGroupName `
    --server $ServerName `
    -o json 2>$null

if ($firewallRules) {
    $rules = $firewallRules | ConvertFrom-Json

    Write-Host "Firewall rules found: $($rules.Count)"

    foreach ($rule in $rules) {
        Write-Host ""
        Write-Host "Rule Name : $($rule.name)"
        Write-Host "Start IP  : $($rule.startIpAddress)"
        Write-Host "End IP    : $($rule.endIpAddress)"
    }
}
else {
    Write-Host "No firewall rules found or unable to retrieve rules."
}

# Security summary
Write-Host ""
Write-Host "============================================"
Write-Host " Security Review Completed"
Write-Host "============================================"

Write-Host ""
Write-Host "Recommended controls:"
Write-Host "- Use Microsoft Entra ID authentication"
Write-Host "- Use Managed Identity where possible"
Write-Host "- Apply least privilege"
Write-Host "- Restrict firewall rules"
Write-Host "- Prefer Private Endpoint for sensitive workloads"
Write-Host "- Enable SQL Auditing"
Write-Host "- Use Log Analytics / Microsoft Sentinel"
Write-Host "- Review Microsoft Defender for Cloud"
Write-Host "- Protect data with TDE and TLS"
Write-Host ""
