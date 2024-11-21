resource "azurerm_key_vault_secret" "username" {
  for_each     = var.secrets-data
  name         = each.value.secret_username
  value        = each.value.username_value
  key_vault_id = data.azurerm_key_vault.keyvault-data.id
}
resource "azurerm_key_vault_secret" "password" {
  for_each     = var.secrets-data
  name         = each.value.secret_pass
  value        = each.value.password_value
  key_vault_id = data.azurerm_key_vault.keyvault-data.id
}
