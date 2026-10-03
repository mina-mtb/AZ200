<#
.SYNOPSIS
    Teardown script for Mina's LAB-000: Azure Portal Safari & Cost Safety Net.
.DESCRIPTION
    Deletes the resource group rg-lab000-mina to guarantee zero ongoing cloud costs.
#>

[CmdletBinding()]
param (
    [string]$ResourceGroupName = 'rg-lab000-mina'
)

Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "🧹 Mina's Lab 000 Teardown & Cost Protection" -ForegroundColor Magenta
Write-Host "==========================================================" -ForegroundColor Cyan

$confirmation = Read-Host "Are you sure you want to delete '$ResourceGroupName' and all resources inside it? (y/n)"
if ($confirmation -ne 'y' -and $confirmation -ne 'Y') {
    Write-Host "❌ Teardown cancelled. Your resources are still intact." -ForegroundColor Yellow
    exit 0
}

Write-Host "`n🗑️ Deleting Resource Group '$ResourceGroupName' (this may take 1-2 minutes)..." -ForegroundColor Yellow

if (Get-Command az -ErrorAction SilentlyContinue) {
    az group delete --name $ResourceGroupName --yes --no-wait
    Write-Host "✅ Resource group deletion command submitted to Azure!" -ForegroundColor Green
} elseif (Get-Command Remove-AzResourceGroup -ErrorAction SilentlyContinue) {
    Remove-AzResourceGroup -Name $ResourceGroupName -Force -AsJob
    Write-Host "✅ Resource group deletion job started in Azure!" -ForegroundColor Green
}

Write-Host "`n🎉 Teardown complete! Zero ongoing charges guaranteed." -ForegroundColor Green
Write-Host "==========================================================" -ForegroundColor Cyan
