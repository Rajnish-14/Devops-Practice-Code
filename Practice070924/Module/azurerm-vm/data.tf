data "azurerm_network_interface" "data-nic" {
  for_each            = var.vm-var
  name                = each.value.nic_name
  resource_group_name = each.value.resource_group_name
}
data "azurerm_key_vault" "data-kv" {
  for_each            = var.vm-var
  name                = each.value.kv_name
  resource_group_name = each.value.resource_group_name
}
