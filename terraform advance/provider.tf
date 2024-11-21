terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.4.0"
    }
  }
}

provider "azurerm" {
 features {}
 subscription_id = "3d657e3a-6fed-403c-ba67-10a6ee89ace8"
}