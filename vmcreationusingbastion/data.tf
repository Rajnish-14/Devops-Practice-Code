data "azurerm_key_vault" "kv" {
  name                = "mykeyvaultforvm1"
  resource_group_name = "rajnish-rg-vm"
}

data "azurerm_key_vault_secret" "username" {
  name         = "vmusername3"
  key_vault_id = data.azurerm_key_vault.kv.id
}

data "azurerm_key_vault_secret" "password" {
  name         = "mpassword1"
  key_vault_id = data.azurerm_key_vault.kv.id
}