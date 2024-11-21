variable "rg-name" {}

variable "rg-location" {}


resource "azurerm_resource_group" "rg-depen" {
  name     = var.rg-name
  location = var.rg-location
}
