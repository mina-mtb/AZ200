// ==============================================================================
// LAB-000: Azure Portal Safari & Cost Management Safety Net
// Author: Jojo (Cloud AI Mentor for Mina 🌸)
// Purpose: Beginner-friendly Bicep template defining lab tags and metadata
// ==============================================================================

// Target scope: This template deploys resources inside a Resource Group
targetScope = 'resourceGroup'

// Parameter: The location where resources should be created (defaults to the Resource Group's location)
@description('The Azure region where metadata and resources will be provisioned')
param location string = resourceGroup().location

// Parameter: Project owner tag
@description('Owner of this lab environment')
param owner string = 'Mina'

// Parameter: Environment tag
@description('Environment classification tag')
param environment string = 'Learning-Sandbox'

// Parameter: Lab identifier
@description('Lab tracking identifier')
param labId string = 'LAB-000'

// Output: Return a confirmation message and the deployed location back to PowerShell
output welcomeMessage string = 'Congratulations Mina! Your LAB-000 infrastructure is active in ${location}.'
output labStatus string = 'Safety Net Active - Ready for Learning!'
