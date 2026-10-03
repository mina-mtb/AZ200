<#
.SYNOPSIS
    Deploy script for Mina's LAB-000: Azure Portal Safari & Cost Safety Net.
.DESCRIPTION
    Provisions the resource group rg-lab000-mina and deploys the Bicep template.
#>

[CmdletBinding()]
param (
    [string]$ResourceGroupName = 'rg-lab000-mina',
    [string]$Location = 'eastus'
)

$ErrorActionPreference = 'Stop'

Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "🌸 Welcome to Mina's Azure Lab 000 Deployment!" -ForegroundColor Magenta
Write-Host "==========================================================" -ForegroundColor Cyan

# Step 1: Verify Azure Authentication
Write-Host "`n🔍 Checking Azure Login status..." -ForegroundColor Yellow
$azContext = $null

if (Get-Command az -ErrorAction SilentlyContinue) {
    $azAccountJson = az account show 2>$null
    if ($azAccountJson) {
        $azAccount = $azAccountJson | ConvertFrom-Json
        Write-Host "✅ Logged in via Azure CLI as: $($azAccount.user.name)" -ForegroundColor Green
        Write-Host "📌 Active Subscription: $($azAccount.name) ($($azAccount.id))" -ForegroundColor Cyan
    } else {
        Write-Host "⚠️ Not logged in to Azure CLI. Running 'az login'..." -ForegroundColor Yellow
        az login
    }
} elseif (Get-Command Get-AzContext -ErrorAction SilentlyContinue) {
    $azContext = Get-AzContext
    if (-not $azContext) {
        Write-Host "⚠️ Not logged in to Az PowerShell. Running 'Connect-AzAccount'..." -ForegroundColor Yellow
        Connect-AzAccount
    }
    Write-Host "✅ Logged in via Azure PowerShell: $($azContext.Account.Id)" -ForegroundColor Green
} else {
    Write-Error "❌ Neither Azure CLI ('az') nor Azure PowerShell ('Az') was found. Please install Azure CLI or sign in via portal.azure.com."
}

# Step 2: Create Resource Group
Write-Host "`n📦 Ensuring Resource Group '$ResourceGroupName' exists in '$Location'..." -ForegroundColor Yellow
az group create --name $ResourceGroupName --location $Location --tags Project="Mina-AI-Roadmap" Lab="LAB-000" Owner="Mina" --output table

# Step 3: Deploy Bicep Template
Write-Host "`n🚀 Deploying Bicep template (main.bicep)..." -ForegroundColor Yellow
$deploymentOutput = az deployment group create `
    --resource-group $ResourceGroupName `
    --template-file "$PSScriptRoot/main.bicep" `
    --output json | ConvertFrom-Json

Write-Host "`n==========================================================" -ForegroundColor Green
Write-Host "🎉 SUCCESS! LAB-000 Deployment is Complete!" -ForegroundColor Green
Write-Host "==========================================================" -ForegroundColor Green
Write-Host "👉 Resource Group: $ResourceGroupName" -ForegroundColor White
Write-Host "👉 Location:       $Location" -ForegroundColor White
Write-Host "👉 Message:        $($deploymentOutput.properties.outputs.welcomeMessage.value)" -ForegroundColor Cyan
Write-Host "👉 Status:         $($deploymentOutput.properties.outputs.labStatus.value)" -ForegroundColor Yellow
Write-Host "`n💡 Next Step: Open the Azure Portal (https://portal.azure.com) to view your resource group!" -ForegroundColor Magenta
