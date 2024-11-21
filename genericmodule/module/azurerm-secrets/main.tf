resource "azurerm_key_vault_secret" "username" {
  for_each     = var.secrets-data
  name         = each.value.secret_username
  value        = each.value.username_value
  key_vault_id = data.azurerm_key_vault.keyvault-data[each.key].id
}
resource "azurerm_key_vault_secret" "password" {
  for_each     = var.secrets-data
  name         = each.value.secret_pass
  value        = random_password.vm_secure_password[each.key].result
  key_vault_id = data.azurerm_key_vault.keyvault-data[each.key].id
}

resource "random_password" "vm_secure_password" {
  for_each = var.secrets-data
  length  = each.value.vm_password_length
  special = true
  upper   = true
  lower   = true
  numeric  = true
}