<#
.SYNOPSIS
    Automated deployment script for Mina's LAB-001: Resource Groups, Tagging & Cloud Organization.
.DESCRIPTION
    Checks Azure login, provisions the resource group 'rg-lab001-mina' with standardized metadata tags,
    and deploys the Bicep template.
#>

[CmdletBinding()]
param (
    [string]$ResourceGroupName = 'rg-lab001-mina',
    [string]$Location = 'eastus',
    [string]$Owner = 'Mina',
    [string]$Environment = 'Learning-Sandbox',
    [string]$Project = 'Azure-AI-Journey',
    [string]$CostCenter = 'Lab-001'
)

$ErrorActionPreference = 'Stop'

Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "🌸 Welcome to Mina's Azure Lab 001 Deployment!" -ForegroundColor Magenta
Write-Host "Topic: Resource Groups, Tagging & Cloud Organization" -ForegroundColor DarkCyan
Write-Host "==========================================================" -ForegroundColor Cyan

# Step 1: Check Azure Authentication
Write-Host "`n🔍 Checking Azure Login status..." -ForegroundColor Yellow
$hasCli = Get-Command az -ErrorAction SilentlyContinue
$hasPosh = Get-Command Get-AzContext -ErrorAction SilentlyContinue

if ($hasCli) {
    $azAccountJson = az account show 2>$null
    if ($azAccountJson) {
        $azAccount = $azAccountJson | ConvertFrom-Json
        Write-Host "✅ Logged in via Azure CLI as: $($azAccount.user.name)" -ForegroundColor Green
        Write-Host "📌 Active Subscription: $($azAccount.name) ($($azAccount.id))" -ForegroundColor Cyan
    } else {
        Write-Host "⚠️ Not logged into Azure CLI. Running 'az login'..." -ForegroundColor Yellow
        az login
    }
} elseif ($hasPosh) {
    $azContext = Get-AzContext
    if (-not $azContext) {
        Write-Host "⚠️ Not logged into Azure PowerShell. Running 'Connect-AzAccount'..." -ForegroundColor Yellow
        Connect-AzAccount
    }
    Write-Host "✅ Logged in via Azure PowerShell: $($azContext.Account.Id)" -ForegroundColor Green
} else {
    Write-Error "❌ Neither Azure CLI ('az') nor Azure PowerShell ('Az') was found. Please sign in via portal.azure.com or install Azure CLI."
}

# Step 2: Create Resource Group with Standardized Tags
Write-Host "`n📦 Ensuring Resource Group '$ResourceGroupName' exists in '$Location' with custom tags..." -ForegroundColor Yellow

$tagsString = "Owner=$Owner Environment=$Environment Project=$Project CostCenter=$CostCenter ManagedWith=Bicep"

if ($hasCli) {
    az group create `
        --name $ResourceGroupName `
        --location $Location `
        --tags Owner=$Owner Environment=$Environment Project=$Project CostCenter=$CostCenter ManagedWith=Bicep `
        --output table
} elseif ($hasPosh) {
    $tagTable = @{
        Owner       = $Owner
        Environment = $Environment
        Project     = $Project
        CostCenter  = $CostCenter
        ManagedWith = 'Bicep'
    }
    New-AzResourceGroup -Name $ResourceGroupName -Location $Location -Tag $tagTable -Force | Out-Null
    Write-Host "✅ Resource group '$ResourceGroupName' created/updated in Az PowerShell." -ForegroundColor Green
}

# Step 3: Deploy Bicep Template
Write-Host "`n🚀 Deploying Bicep template (main.bicep)..." -ForegroundColor Yellow
$bicepPath = Join-Path $PSScriptRoot "main.bicep"

if ($hasCli) {
    $deploymentOutput = az deployment group create `
        --resource-group $ResourceGroupName `
        --template-file $bicepPath `
        --parameters owner=$Owner environment=$Environment projectName=$Project costCenter=$CostCenter `
        --output json | ConvertFrom-Json

    $welcomeMsg = $deploymentOutput.properties.outputs.welcomeMessage.value
    $labStatus = $deploymentOutput.properties.outputs.labStatus.value
    $rgId = $deploymentOutput.properties.outputs.resourceGroupId.value
}

Write-Host "`n==========================================================" -ForegroundColor Green
Write-Host "🎉 SUCCESS! LAB-001 Deployment is Complete!" -ForegroundColor Green
Write-Host "==========================================================" -ForegroundColor Green
Write-Host "👉 Resource Group: $ResourceGroupName" -ForegroundColor White
Write-Host "👉 Location:       $Location" -ForegroundColor White
Write-Host "👉 Owner Tag:      $Owner" -ForegroundColor Yellow
Write-Host "👉 Environment:    $Environment" -ForegroundColor Yellow
Write-Host "👉 Project Tag:    $Project" -ForegroundColor Yellow
Write-Host "👉 Cost Center:    $CostCenter" -ForegroundColor Yellow
if ($welcomeMsg) {
    Write-Host "`n📢 Message from Jojo:" -ForegroundColor Magenta
    Write-Host "   $welcomeMsg" -ForegroundColor Cyan
    Write-Host "   $labStatus" -ForegroundColor Green
}
Write-Host "`n💡 Next Step: Open the Azure Portal (https://portal.azure.com) and search for '$ResourceGroupName' to view your tags and test Resource Locks!" -ForegroundColor Magenta
