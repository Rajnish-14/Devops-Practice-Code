terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.0.1"
    }

  }
}
provider "azurerm" {
  features {
  }
  subscription_id = "ce215649-97f1-4dc9-8f02-14f895ca1f2f"
}
