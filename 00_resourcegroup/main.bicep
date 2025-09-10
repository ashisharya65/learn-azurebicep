targetScope = 'subscription'

@description('the name of the resource group to create')
param resourceGroupName string

resource resourceGroup 'Microsoft.Resources/resourceGroups@2025-04-01' = {
  name: resourceGroupName
  location: deployment().location
  tags: {
    environment: 'BicepDemo'
  }
}

output resourceGroupName string = resourceGroup.name
output resourceGroupId string = resourceGroup.id
