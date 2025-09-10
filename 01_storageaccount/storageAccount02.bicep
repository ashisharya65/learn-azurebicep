@description('The name of the storage account.')
param storageAccountName string = 'stg${uniqueString(resourceGroup().id)}'

@description('The Azure region for the resources. Defaults to the resource group location.')
param location string = resourceGroup().location

@description('The environment type which determines the storage account SKU.')
@allowed([
  'nonprod'
  'prod'
])
param environmentType string

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

output storageAccountName string = storageAccountName
output storageAccountId string = storageaccount.id
