param location string = 'CanadaCentral'

resource appServicePlan 'Microsoft.Web/serverfarms@2021-02-01' = {
  name: 'YourAppServicePlan'
  location: location
  properties: {
    sku: {
      family: 'F',
      capacity: 1,
      name: 'F1'
    }
  }
}

resource webApp 'Microsoft.Web/sites@2021-02-01' = {
  name: 'YourWebApp'
  location: location
  properties: {
    serverFarmId: appServicePlan.id
  }
}

resource appGateway 'Microsoft.Network/applicationGateways@2021-02-01' = {
  name: 'YourAppGateway'
  location: location
  properties: {
    // Add application gateway properties
  }
}

output webAppUrl string = webApp.properties.defaultHostName
