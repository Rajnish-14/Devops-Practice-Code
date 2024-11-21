
data "azurerm_subnet" "subnet-dadablock" {
  name                 = "frontendsubnet"
  virtual_network_name = "dev-vnet"
  resource_group_name  = "rg1"
}
data "azurerm_key_vault" "credential-block" {
  name                = "teluskeyvault"
  resource_group_name = "rg1"
}

data "azurerm_key_vault_secret" "userid-data" {
  name= "userid"
  key_vault_id = data.azurerm_key_vault.credential-block.id
}
data "azurerm_key_vault_secret" "password-data" {
  name= "password"
  key_vault_id = data.azurerm_key_vault.credential-block.id
}