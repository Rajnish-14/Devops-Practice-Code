resource "azurerm_resource_group" "name" {
  for_each = var.rg-variable
  name     = each.value.name
  location = each.value.location
}
