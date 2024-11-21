terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.115.0"
    }
  }
#   backend "azurerm" {
#     resource_group_name = "rajnish-rg"
#     storage_account_name = "devsrg1"
#     container_name = "backend"
#     key = "dev.terrform.tfstate"
#   }
}
provider "azurerm" {
  features {}
}
