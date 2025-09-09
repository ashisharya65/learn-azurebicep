
param vnetName string
param location string = resourceGroup().location
param addressPrefix string = '10.0.0.0/16'
param subnetPrefix string = '10.0.0.0/24'
param subnetName string

resource vnet 'Microsoft.Network/virtualnetworks@2023-05-01' = {
  name:vnetName
  location:location
  properties: {
    addressSpace: {
      addressPrefixes: [
        addressPrefix
      ]
    }
    subnets:[
      {
        name: subnetName
        properties: {
          addressPrefix: subnetPrefix
        }
      }
    ]
  }
}


output subnetId string = vnet.properties.subnets[0].id
