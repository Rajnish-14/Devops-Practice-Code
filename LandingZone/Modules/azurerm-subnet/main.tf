resource "azurerm_subnet" "subnets" {
  for_each             = var.module-subnet
  name                 = each.value.subnet_name
  resource_group_name  = each.value.subnet_rg_name
  virtual_network_name = each.value.vnet_name
  address_prefixes     = each.value.subnet_address_prefixes
}
