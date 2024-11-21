resource "azurerm_key_vault" "kvs" {
  for_each                    = var.module_keyvault
  name                        = each.value.keyvault_name
  resource_group_name         = each.value.kv_rg_name
  location                    = each.value.kv_location
  sku_name                    = each.value.kv_sku_name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false
  enabled_for_disk_encryption = true

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get","Backup", "Create", "Decrypt", "Delete", "Encrypt", "Get", "Import", "List", "Purge", "Recover", "Restore", "Sign", "UnwrapKey", "Update", "Verify", "WrapKey", "Release", "Rotate"
    ]

    storage_permissions = [
      "Get",
    ]
  }
}
