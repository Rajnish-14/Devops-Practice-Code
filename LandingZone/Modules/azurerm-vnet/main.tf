resource "azurerm_virtual_network" "vnets" {
  for_each            = var.module-vnet
  name                = each.value.vnet_name
  resource_group_name = each.value.vnet_rg_name
  location            = each.value.vnet_location
  address_space       = each.value.vnet_address_space
}
