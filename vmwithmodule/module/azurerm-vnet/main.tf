resource "azurerm_vitual_network" "vnet-dev" {
  for_each            = var.vnet-var
  name                = each.value.virtual_network_name
  loocation           = each.value.location
  resource_group_name = each.value.resource_group_name
  address_space       = [each.value.address_space]
}
