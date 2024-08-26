terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.0.1"
    }
  }
}

provider "azurerm" {
features {
}
}
resource "azurerm_resource_group" "TerraSeun" {
    name = "TerraSeun"

location = "Uksouth"
}
resource "azurerm_virtual_network" "vnetseun" {
  name = "vnetseun"
  address_space = ["10.0.0.0/16"]
  location = azurerm_resource_group.TerraSeun.location
  resource_group_name = azurerm_resource_group.TerraSeun.name
  
}
resource "azurerm_subnet" "vnetseunsub" {
  name = "vnetseunsub"
  address_prefixes = ["10.0.2.0/24"]
  resource_group_name = azurerm_resource_group.TerraSeun.name
  virtual_network_name = azurerm_virtual_network.vnetseun
}