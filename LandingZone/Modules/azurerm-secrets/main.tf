resource "azurerm_key_vault_secret" "kvsecrets" {
  for_each=var.module-secrets
  name = each.value.secrets_name
  value        = random_password.password.result
  key_vault_id = data.azurerm_key_vault.kv-data.id
}

resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}