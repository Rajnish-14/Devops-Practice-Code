terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.10.0"
    }
  }
  # backend "azurerm" {
  #   resource_group_name  = "dev-vm-rg"
  #   storage_account_name = "pipelinestorage1234"
  #   container_name       = "pipelinecontainer"
  #   key                  = "dev.terraform.tfstate"
  # }
}
provider "azurerm" {
  features { }
  subscription_id = "9a27b25f-86a0-4bce-b332-afb453188d80"
}
