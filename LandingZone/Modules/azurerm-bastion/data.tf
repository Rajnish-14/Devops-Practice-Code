data "azurerm_subnet" "subnet_data" {
  for_each             = var.module-bastion
  name                 = each.value.subnet_name
  resource_group_name  = each.value.rg_name
  virtual_network_name = each.value.vnet_name
}

data "azurerm_public_ip" "PIP_data" {
  for_each            = var.module-bastion
  name                = each.value.PIP_name
  resource_group_name = each.value.rg_name
}
