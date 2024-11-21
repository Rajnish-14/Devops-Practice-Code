terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.110.0"
    }
  }
}

provider "azurerm" {
  features {
  }
}
resource "azurerm_resource_group" "New_rg1" {
  name     = "Newresourcegroup1"
  location = "West Europe"
}
resource "azurerm_resource_group" "New_rg2" {
  name     = "Newresourcegroup2"
  location = "West Europe"
}