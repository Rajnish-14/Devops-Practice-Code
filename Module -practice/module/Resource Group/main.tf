resource "azurerm_resource_group" "rgs" {
  for_each = var.rg_variavble
  name = each.value.name
  location = each.value.location
}