resource "azurerm_resource_group" "RajnishRG5" {
  name     = "devopsg56"
  location = "West Europe"
}

provider "azurerm" {
  features {}
}