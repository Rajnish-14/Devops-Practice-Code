resource "azurerm_virtual_network" "main_vnet" {
  for_each            = var.vm_vnet
  name                = each.value.name
  address_space       = each.value.address_space
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
}
