param location string = resourceGroup().location
param vnetName string = 'CYS550-VNet'
param addressPrefix string = '10.55.0.0/16'

// Network Security Groups
resource analysisNSG 'Microsoft.Network/networkSecurityGroups@2023-05-01' = {
  name: 'Analysis-NSG'
  location: location
  properties: {
    securityRules: [
      {
        name: 'Allow-SSH-Inbound'
        properties: {
          priority: 100
          protocol: 'Tcp'
          access: 'Allow'
          direction: 'Inbound'
          sourceAddressPrefix: '*' // Ideally restrict to your IP
          sourcePortRange: '*'
          destinationAddressPrefix: '*'
          destinationPortRange: '22'
        }
      }
      {
        name: 'Allow-RDP-Inbound'
        properties: {
          priority: 110
          protocol: 'Tcp'
          access: 'Allow'
          direction: 'Inbound'
          sourceAddressPrefix: '*'
          sourcePortRange: '*'
          destinationAddressPrefix: '*'
          destinationPortRange: '3389'
        }
      }
    ]
  }
}

resource victimNSG 'Microsoft.Network/networkSecurityGroups@2023-05-01' = {
  name: 'Victim-NSG'
  location: location
  properties: {
    securityRules: [
      {
        name: 'Deny-Internet-Outbound'
        properties: {
          priority: 400
          protocol: '*'
          access: 'Deny'
          direction: 'Outbound'
          sourceAddressPrefix: '*'
          sourcePortRange: '*'
          destinationAddressPrefix: 'Internet'
          destinationPortRange: '*'
        }
      }
    ]
  }
}

resource malwareNSG 'Microsoft.Network/networkSecurityGroups@2023-05-01' = {
  name: 'Malware-NSG'
  location: location
  properties: {
    securityRules: [
      {
        name: 'Deny-All-Outbound'
        properties: {
          priority: 400
          protocol: '*'
          access: 'Deny'
          direction: 'Outbound'
          sourceAddressPrefix: '*'
          sourcePortRange: '*'
          destinationAddressPrefix: '*'
          destinationPortRange: '*'
        }
      }
    ]
  }
}

// Virtual Network
resource vnet 'Microsoft.Network/virtualNetworks@2023-05-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        addressPrefix
      ]
    }
    subnets: [
      {
        name: 'Analysis-Subnet'
        properties: {
          addressPrefix: '10.55.1.0/24'
          networkSecurityGroup: {
            id: analysisNSG.id
          }
        }
      }
      {
        name: 'Victim-Subnet'
        properties: {
          addressPrefix: '10.55.10.0/24'
          networkSecurityGroup: {
            id: victimNSG.id
          }
        }
      }
      {
        name: 'Malware-Subnet'
        properties: {
          addressPrefix: '10.55.20.0/24'
          networkSecurityGroup: {
            id: malwareNSG.id
          }
        }
      }
    ]
  }
}
