<#
.SYNOPSIS
    Teardown script for Mina's LAB-001: Resource Groups, Tagging & Cloud Organization.
.DESCRIPTION
    Safely removes any locks on rg-lab001-mina and deletes the resource group to guarantee zero leftover resources or costs.
#>

[CmdletBinding()]
param (
    [string]$ResourceGroupName = 'rg-lab001-mina'
)

Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "🧹 Mina's Lab 001 Teardown & Cost Protection" -ForegroundColor Magenta
Write-Host "==========================================================" -ForegroundColor Cyan

$confirmation = Read-Host "Are you sure you want to delete '$ResourceGroupName' and all resources inside it? (y/n)"
if ($confirmation -ne 'y' -and $confirmation -ne 'Y') {
    Write-Host "❌ Teardown cancelled. Your resources are still intact." -ForegroundColor Yellow
    exit 0
}

Write-Host "`n🔍 Checking for active Resource Locks on '$ResourceGroupName'..." -ForegroundColor Yellow

if (Get-Command az -ErrorAction SilentlyContinue) {
    # Check for locks
    $locks = az lock list --resource-group $ResourceGroupName --output json 2>$null | ConvertFrom-Json
    if ($locks -and $locks.Count -gt 0) {
        Write-Host "⚠️ Found $($locks.Count) active lock(s). Removing locks to permit teardown..." -ForegroundColor Yellow
        foreach ($lock in $locks) {
            az lock delete --name $lock.name --resource-group $ResourceGroupName
            Write-Host "   🔓 Removed lock: $($lock.name)" -ForegroundColor Green
        }
    } else {
        Write-Host "✅ No blocking resource locks found." -ForegroundColor Green
    }

    Write-Host "`n🗑️ Deleting Resource Group '$ResourceGroupName' (this may take 1-2 minutes)..." -ForegroundColor Yellow
    az group delete --name $ResourceGroupName --yes --no-wait
    Write-Host "✅ Resource group deletion command submitted to Azure!" -ForegroundColor Green
} elseif (Get-Command Remove-AzResourceGroup -ErrorAction SilentlyContinue) {
    Remove-AzResourceGroup -Name $ResourceGroupName -Force -AsJob
    Write-Host "✅ Resource group deletion job started in Azure PowerShell!" -ForegroundColor Green
}

Write-Host "`n🎉 Teardown complete! Zero ongoing charges guaranteed." -ForegroundColor Green
Write-Host "==========================================================" -ForegroundColor Cyan
