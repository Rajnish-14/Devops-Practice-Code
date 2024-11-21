resource "azurerm_resource_group" "rgs" {
  for_each = var.mdule-rg
  name     = each.value.rg_name
  location = each.value.rg_location
}
