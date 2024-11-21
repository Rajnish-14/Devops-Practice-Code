terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.9.0"
    }
  }
}
provider "azurerm" {
 features {}

 subscription_id = "9a27b25f-86a0-4bce-b332-afb453188d80"
}


resource "azurerm_resource_group" "rgs" {
  name     = "testResourceGroup1"
  location = "West US"
}
