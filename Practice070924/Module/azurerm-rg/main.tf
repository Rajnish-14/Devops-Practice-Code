resource "azurerm_resource_group" "rkg-rg" {
  for_each = var.rg-variable
  name     = each.value.rg_name
  location = each.value.location
}
