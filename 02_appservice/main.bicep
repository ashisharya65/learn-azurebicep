
@description('The Azure region for the resources.')
param location string = 'centralus'

@description('The environment type which determines the storage account SKU.')
@allowed([
  'nonprod'
  'prod'
])
param environmentType string

var storageAccountName = 'stg${uniqueString(resourceGroup().id)}'
var appServicePlanName = 'asp-${uniqueString(resourceGroup().id)}'
var appServiceName = 'as-${uniqueString(resourceGroup().id)}'
var storageAccountSkuName string = (environmentType == 'prod') ? 'Standard_GRS' : 'Standard_LRS'

resource storageaccount 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: storageAccountName
  location: location
  kind: 'StorageV2'
  sku: {
    name: storageAccountSkuName
  }
  properties: {
    accessTier: 'Hot'
  }
}

resource appServicePlan 'Microsoft.Web/serverfarms@2024-11-01' = {
  name: appServicePlanName
  location:location
  sku: {
    name : 'B1'
  }
}

resource appServiceApp 'Microsoft.Web/sites@2024-11-01' = {
  name: appServiceName
  location:location
  properties : {
    serverFarmId: appServicePlan.id
    httpsOnly: true
  } 
}

output storageAccountName string = storageAccountName
output storageAccountId string = storageaccount.id
output appServiceName string = appServiceName
output appServicePlanId string = appServicePlan.id
