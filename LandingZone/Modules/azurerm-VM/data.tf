data "azurerm_network_interface" "data-nic" {
  for_each            = var.module-vm
  name                = each.value.nic_name
  resource_group_name = each.value.rg_name
}

data "azurerm_key_vault_secret" "data-secrets" {
  for_each     = var.module-vm
  name         = each.value.datascerets_name
  key_vault_id = data.azurerm_key_vault.existing.id
}
