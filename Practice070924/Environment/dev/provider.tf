terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.1.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.2"
    }
  }
  backend "azurerm" {
    resource_group_name  = "dev-vm-rg"
    storage_account_name = "pipelinestorage1234"
    container_name       = "pipelinecontainer"
    key                  = "rkgstatefile.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "ce215649-97f1-4dc9-8f02-14f895ca1f2f"
}
provider "random" {

}
