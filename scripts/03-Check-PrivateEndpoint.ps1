# Azure SQL Private Endpoint Check
# Purpose: Check Private Endpoint configuration for an Azure SQL Server
# This script is intended for learning and lab purposes.

param (
    [Parameter(Mandatory = $true)]
    [string]$ResourceGroupName,

    [Parameter(Mandatory = $true)]
    [string]$ServerName
)

Write-Host "============================================"
Write-Host " Azure SQL Private Endpoint Check"
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

# Get SQL Server resource ID
Write-Host ""
Write-Host "[2] Getting Azure SQL Server resource ID..."

$serverId = az sql server show `
    --resource-group $ResourceGroupName `
    --name $ServerName `
    --query "id" `
    -o tsv 2>$null

if (-not $serverId) {
    Write-Host "ERROR: Azure SQL Server was not found."
    exit 1
}

Write-Host "SQL Server found: OK"

# Check Private Endpoints
Write-Host ""
Write-Host "[3] Checking Private Endpoints..."

$privateEndpoints = az network private-endpoint-connection list `
    --name $ServerName `
    --resource-group $ResourceGroupName `
    --type Microsoft.Sql/servers `
    -o json 2>$null

if (-not $privateEndpoints) {
    Write-Host "No Private Endpoint connections found."
}
else {

    $connections = $privateEndpoints | ConvertFrom-Json

    Write-Host ""
    Write-Host "Private Endpoint Connections Found: $($connections.Count)"

    foreach ($connection in $connections) {

        Write-Host ""
        Write-Host "--------------------------------------------"
        Write-Host "Connection Name : $($connection.name)"
        Write-Host "Status          : $($connection.privateLinkServiceConnectionState.status)"
        Write-Host "Description     : $($connection.privateLinkServiceConnectionState.description)"
        Write-Host "--------------------------------------------"

        if ($connection.privateLinkServiceConnectionState.status -eq "Approved") {
            Write-Host "PASS: Private Endpoint connection is approved."
        }
        else {
            Write-Host "WARNING: Private Endpoint connection requires review."
        }
    }
}

# Check public network access
Write-Host ""
Write-Host "[4] Checking public network access..."

$publicAccess = az sql server show `
    --resource-group $ResourceGroupName `
    --name $ServerName `
    --query "publicNetworkAccess" `
    -o tsv 2>$null

Write-Host "Public Network Access: $publicAccess"

if ($publicAccess -eq "Disabled") {
    Write-Host "PASS: Public network access is disabled."
}
else {
    Write-Host "WARNING: Public network access is enabled."
}

# Security recommendations
Write-Host ""
Write-Host "============================================"
Write-Host " Private Endpoint Review Completed"
Write-Host "============================================"

Write-Host ""
Write-Host "Security Recommendations:"
Write-Host "1. Use Private Endpoint for sensitive workloads."
Write-Host "2. Configure Private DNS correctly."
Write-Host "3. Test application connectivity through the private network."
Write-Host "4. Disable public network access after private connectivity is verified."
Write-Host "5. Review Private Endpoint connections regularly."
Write-Host ""
