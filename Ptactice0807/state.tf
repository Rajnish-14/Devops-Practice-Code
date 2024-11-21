terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.111.0"
    }
  }
}
provider "azurerm" {
  features {}
  # Configuration options
}
resource "azurerm_resource_group" "rajnish-explicity" {
name = "rajnish-explicit"
location = "West India"
}
resource "azurerm_storage_account" "rajnishimplicity" {
  name = "storagerajnishimplicity"
  resource_group_name      = azurerm_resource_group.rajnish-implicity.name
  location                 = azurerm_resource_group.rajnish-implicity.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
resource "azurerm_resource_group" "rajnish-implicity" {
name = "rajnish-implicity-rg"
location = "West India"
}
resource "azurerm_storage_container" "tfcontainer"{
  name                  = "tfcontainer-practice"
  storage_account_name  = azurerm_storage_account.rajnishimplicity.name
  container_access_type = "private"
}
