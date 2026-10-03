// ==============================================================================
// LAB-001: Resource Groups, Tagging & Cloud Organization
// Author: Jojo (Cloud AI Mentor for Mina 🌸)
// Purpose: Beginner-friendly Bicep template demonstrating tags, metadata, and parameters
// ==============================================================================

// Target Scope: This template deploys resources inside a Resource Group
targetScope = 'resourceGroup'

// ------------------------------------------------------------------------------
// 1. PARAMETERS (Inputs you can customize when deploying)
// ------------------------------------------------------------------------------

@description('The Azure region where resources and metadata will be provisioned')
param location string = resourceGroup().location

@description('Name of the person who owns and manages these cloud resources')
param owner string = 'Mina'

@description('Environment classification (e.g., Learning-Sandbox, Dev, Prod)')
param environment string = 'Learning-Sandbox'

@description('Project or learning track this resource belongs to')
param projectName string = 'Azure-AI-Journey'

@description('Cost center code for billing reports and cost allocation')
param costCenter string = 'Lab-001'

// ------------------------------------------------------------------------------
// 2. VARIABLES & TAGS OBJECT
// In Bicep, you can package all your tags into a single reusable object (dictionary)
// ------------------------------------------------------------------------------
var standardTags = {
  Owner: owner
  Environment: environment
  Project: projectName
  CostCenter: costCenter
  DeployedBy: 'Jojo-AI-Lab-Assistant'
  ManagedWith: 'Bicep'
}

// ------------------------------------------------------------------------------
// 3. OUTPUTS
// Outputs return values and helpful status messages back to your PowerShell terminal
// ------------------------------------------------------------------------------

@description('Confirmation greeting for Mina')
output welcomeMessage string = '🌸 Hello Mina! Your LAB-001 Resource Group is active in region: ${location}'

@description('Dictionary of standardized tags applied to this environment')
output appliedTags object = standardTags

@description('Current Resource Group unique ID inside Azure')
output resourceGroupId string = resourceGroup().id

@description('Status confirmation')
output labStatus string = 'Resource Group & Tagging standards successfully validated!'
