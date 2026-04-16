<#
.SYNOPSIS
    MoonBaseIverson Unified Deployment Script

.DESCRIPTION
    Provides a "one-click" experience to self-host the course platform (Docker)
    or provision the cyber lab infrastructure (Azure).

.EXAMPLE
    .\deploy.ps1
#>

$ErrorActionPreference = "Stop"

function Write-Host-Header {
    param($title)
    Write-Host "`n" -NoNewline
    Write-Host " [ MOONBASE IVERSON ] - $title " -BackgroundColor DarkGreen -ForegroundColor White
    Write-Host "`n" -NoNewline
}

function Check-Requirements {
    Write-Host-Header "ENVIRONMENT CHECK"
    
    $docker = Get-Command docker -ErrorAction SilentlyContinue
    $az = Get-Command az -ErrorAction SilentlyContinue
    $node = Get-Command node -ErrorAction SilentlyContinue

    $missing = @()

    if (-not $docker) {
        Write-Warning "  [-] Docker is NOT installed."
        $missing += "Docker.DockerDesktop"
    } else {
        Write-Host "  [+] Docker detected." -ForegroundColor Green
    }

    if (-not $az) {
        Write-Warning "  [-] Azure CLI is NOT installed."
        $missing += "Microsoft.AzureCLI"
    } else {
        Write-Host "  [+] Azure CLI detected." -ForegroundColor Green
    }

    if (-not $node) {
        Write-Warning "  [-] Node.js is NOT installed."
        $missing += "OpenJS.NodeJS.LTS"
    } else {
        Write-Host "  [+] Node.js detected." -ForegroundColor Green
    }

    return $missing
}

function Install-Dependencies {
    param($missingList)
    Write-Host-Header "INSTALLING DEPENDENCIES"
    
    if ($missingList.Count -eq 0) {
        Write-Host "  [!] All dependencies are already installed." -ForegroundColor Yellow
        return
    }

    Write-Host "  [!] The following will be installed via winget: $($missingList -join ', ')" -ForegroundColor Yellow
    $confirm = Read-Host "  [?] Proceed with installation? (y/n)"
    if ($confirm -ne 'y') { return }

    foreach ($app in $missingList) {
        Write-Host "  [>] Installing $app..." -ForegroundColor Cyan
        winget install --id $app --silent --accept-package-agreements --accept-source-agreements
    }

    Write-Host "`n  [SUCCESS] Installation complete." -ForegroundColor Green
    Write-Host "  [IMPORTANT] You may need to RESTART your terminal (or computer for Docker) for changes to take effect." -ForegroundColor Cyan
}

function Deploy-Local {
    Write-Host-Header "LOCAL SELF-HOSTING (DOCKER)"
    
    if (-not (Get-Command docker -ErrorAction SilentlyContinue)) {
        Write-Error "Docker is required for local hosting. Please run 'Install Dependencies' first."
    }

    Write-Host "  [1/2] Building course platform container..." -ForegroundColor Cyan
    docker compose build course-platform

    Write-Host "  [2/2] Starting containers..." -ForegroundColor Cyan
    docker compose up -d

    Write-Host "`n  [SUCCESS] Course platform is now live at: http://localhost:8080" -ForegroundColor Green
    Write-Host "  [INFO] Use 'docker compose down' to stop the services."
}

function Deploy-Azure {
    Write-Host-Header "AZURE INFRASTRUCTURE DEPLOYMENT"

    if (-not (Get-Command az -ErrorAction SilentlyContinue)) {
        Write-Error "Azure CLI is required for cloud deployment. Please run 'Install Dependencies' first."
    }

    try {
        $subscription = az account show --query name -o tsv
    } catch {
        Write-Host "  [!] Not logged into Azure. Opening browser for login..." -ForegroundColor Yellow
        az login
        $subscription = az account show --query name -o tsv
    }

    Write-Host "  [!] Deploying to subscription: $subscription" -ForegroundColor Yellow

    $rgName = Read-Host "  [?] Enter Azure Resource Group name (default: MoonBase-RG)"
    if ([string]::IsNullOrWhiteSpace($rgName)) { $rgName = "MoonBase-RG" }

    $location = Read-Host "  [?] Enter Azure region (default: eastus)"
    if ([string]::IsNullOrWhiteSpace($location)) { $location = "eastus" }

    Write-Host "  [1/3] Creating Resource Group: $rgName..." -ForegroundColor Cyan
    az group create --name $rgName --location $location | Out-Null

    Write-Host "  [2/3] Deploying Bicep templates (VNet, NSGs)..." -ForegroundColor Cyan
    $bicepPath = "courses/adversary-hunting/public/labs/infrastructure/main.bicep"
    az deployment group create --resource-group $rgName --template-file $bicepPath | Out-Null

    Write-Host "`n  [SUCCESS] Azure Infrastructure is provisioned in $rgName." -ForegroundColor Green
    Write-Host "  [INFO] Review your resources in the Azure Portal: https://portal.azure.com"
}

# MAIN MENU
$missingDeps = Check-Requirements

while($true) {
    Write-Host "`n--- Deployment Menu ---"
    Write-Host "0. Install / Update Dependencies (Docker, Azure CLI, Node)" -ForegroundColor Yellow
    Write-Host "1. Deploy Course Platform (Local Docker)"
    Write-Host "2. Deploy Lab Infrastructure (Azure)"
    Write-Host "3. Deploy BOTH (Full Environment)"
    Write-Host "4. Exit"
    
    $choice = Read-Host "`nSelect an option [0-4]"

    switch($choice) {
        "0" { 
            $missingDeps = Check-Requirements
            Install-Dependencies $missingDeps 
            $missingDeps = Check-Requirements # Refresh after install
        }
        "1" { Deploy-Local }
        "2" { Deploy-Azure }
        "3" { 
            Deploy-Local
            Deploy-Azure
        }
        "4" { exit }
        default { Write-Host "Invalid choice, please try again." -ForegroundColor Red }
    }
}
