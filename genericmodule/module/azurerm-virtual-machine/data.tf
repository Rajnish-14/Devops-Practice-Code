data "azurerm_network_interface" "nic-data" {
  for_each            = var.vm-var
  name                = each.value.nic_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_key_vault" "keyvault-data" {
  for_each            = var.vm-var
  name                = each.value.key_vault_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_key_vault_secret" "username-data" {
  for_each     = var.vm-var
  name         = each.value.secret_username
  key_vault_id = data.azurerm_key_vault.keyvault-data[each.key].id
}
data "azurerm_key_vault_secret" "password-data" {
  for_each     = var.vm-var
  name         = each.value.secret_pass
  key_vault_id = data.azurerm_key_vault.keyvault-data[each.key].id
}
