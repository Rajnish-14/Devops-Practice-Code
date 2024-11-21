variable "rg_set" {
  description = "List of resource groups"
  type        = set(string)
  default     = ["rg1", "rg2", "rg3", "rg4", "rg5", "rg5", "rg1", "rg1", "rg1"]
}

variable "location" {
  description = "Location for the resource groups"
  type        = string
  default     = "West Europe"
}

resource "azurerm_resource_group" "example" {
  for_each = var.rg_set
  name     = each.key
  location = var.location
}