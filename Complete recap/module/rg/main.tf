resource "azurerm_resource_group" "rg-block" {
  for_each = var.dev-rg
  name     = each.value.name
  location = each.value.location
}
