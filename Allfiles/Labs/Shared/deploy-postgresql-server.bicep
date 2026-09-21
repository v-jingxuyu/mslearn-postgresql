@description('Location for all resources.')
param location string = resourceGroup().location

@description('Unique name for the Azure Database for PostgreSQL server.')
param serverName string = 'psql-lab-${location}-${uniqueString(resourceGroup().id)}'

@description('PostgreSQL administrator login name.')
param adminLogin string = 'pgAdmin'

@description('PostgreSQL administrator password.')
@minLength(8)
@secure()
param adminLoginPassword string

@description('Public IPv4 address allowed to connect to the lab server.')
param clientIpAddress string

resource postgreSQLFlexibleServer 'Microsoft.DBforPostgreSQL/flexibleServers@2023-03-01-preview' = {
  name: serverName
  location: location
  sku: {
    name: 'Standard_B1ms'
    tier: 'Burstable'
  }
  properties: {
    administratorLogin: adminLogin
    administratorLoginPassword: adminLoginPassword
    authConfig: {
      activeDirectoryAuth: 'Disabled'
      passwordAuth: 'Enabled'
      tenantId: subscription().tenantId
    }
    backup: {
      backupRetentionDays: 7
      geoRedundantBackup: 'Disabled'
    }
    createMode: 'Default'
    highAvailability: {
      mode: 'Disabled'
    }
    storage: {
      autoGrow: 'Disabled'
      storageSizeGB: 32
      tier: 'P10'
    }
    version: '16'
  }
}

resource allowLabRunner 'Microsoft.DBforPostgreSQL/flexibleServers/firewallRules@2023-03-01-preview' = {
  name: 'AllowLabRunner'
  parent: postgreSQLFlexibleServer
  properties: {
    startIpAddress: clientIpAddress
    endIpAddress: clientIpAddress
  }
}

output serverFqdn string = postgreSQLFlexibleServer.properties.fullyQualifiedDomainName
output serverName string = postgreSQLFlexibleServer.name