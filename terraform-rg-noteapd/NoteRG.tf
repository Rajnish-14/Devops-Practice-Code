terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.109.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features{}
}
resource "azurerm_resource_group" "rajnishnoteRG" {
  name     = "rajnishnoteRG"
  location = "West Europe"
}