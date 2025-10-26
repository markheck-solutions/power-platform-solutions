# Deployment Script for AssetTracking
# Generated: 2025-10-26 16:49:08

# PREREQUISITES:
# 1. Install PowerShell modules:
#    Install-Module -Name Microsoft.PowerApps.Administration.PowerShell
#    Install-Module -Name Microsoft.PowerApps.PowerShell -AllowClobber

# 2. Have environment URL ready (e.g., https://yourorg.crm.dynamics.com)

# 3. Have admin credentials or service principal details

Write-Host "==================================================" -ForegroundColor Cyan
Write-Host "  AssetTracking - Deployment Script" -ForegroundColor Cyan
Write-Host "==================================================" -ForegroundColor Cyan
Write-Host ""

# Configuration
$SolutionName = "assettracking"
$SolutionVersion = "[IP_ADDRESS]"

# Get target environment
Write-Host "Available environments:" -ForegroundColor Yellow
Get-AdminPowerAppEnvironment | Select-Object DisplayName, EnvironmentName | Format-Table

$EnvironmentName = Read-Host "Enter target environment name"

if (-not $EnvironmentName) {
    Write-Host "ERROR: Environment name required" -ForegroundColor Red
    exit 1
}

# Connect to environment
Write-Host "`nConnecting to Power Platform..." -ForegroundColor Yellow
Add-PowerAppsAccount

# Verify connection
$env = Get-AdminPowerAppEnvironment -EnvironmentName $EnvironmentName
if (-not $env) {
    Write-Host "ERROR: Could not connect to environment" -ForegroundColor Red
    exit 1
}

Write-Host "Connected to: $($env.DisplayName)" -ForegroundColor Green

# Manual import instructions
Write-Host "`n==================================================" -ForegroundColor Cyan
Write-Host "  Manual Import Steps" -ForegroundColor Cyan
Write-Host "==================================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Since this is an auto-generated solution, follow these steps:" -ForegroundColor Yellow
Write-Host ""
Write-Host "1. Go to https://make.powerapps.com" -ForegroundColor White
Write-Host "2. Select environment: $($env.DisplayName)" -ForegroundColor White
Write-Host "3. Navigate to Solutions > Import" -ForegroundColor White
Write-Host "4. Import solution files from this directory" -ForegroundColor White
Write-Host ""
Write-Host "OR create manually:" -ForegroundColor Yellow
Write-Host ""
Write-Host "1. Create new solution named: AssetTracking" -ForegroundColor White
Write-Host "2. Add tables as defined in: tables/*.json" -ForegroundColor White
Write-Host "3. Create Model-Driven App from: app_definition.json" -ForegroundColor White
Write-Host "4. Import flows from: flows/*.json" -ForegroundColor White
Write-Host "5. Configure security roles from: security/roles.json" -ForegroundColor White
Write-Host ""

# Post-deployment configuration
Write-Host "==================================================" -ForegroundColor Cyan
Write-Host "  Post-Deployment Checklist" -ForegroundColor Cyan
Write-Host "==================================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "[ ] Update connection references to production" -ForegroundColor Yellow
Write-Host "[ ] Assign security roles to users" -ForegroundColor Yellow
Write-Host "[ ] Configure environment variables" -ForegroundColor Yellow
Write-Host "[ ] Test all flows" -ForegroundColor Yellow
Write-Host "[ ] Enable audit logging" -ForegroundColor Yellow
Write-Host "[ ] Configure alerts/monitoring" -ForegroundColor Yellow
Write-Host ""
Write-Host "Deployment preparation complete!" -ForegroundColor Green
Write-Host "Review governance.md for detailed deployment requirements." -ForegroundColor Cyan
