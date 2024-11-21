resource "azurerm_key_vault" "example" {
    for_each = var.keyvault-vm
  name                        = each.value.key_vault_name
  location                    = each.value.location
  resource_group_name         = each.value.resource_group_name
  enabled_for_disk_encryption = each.value.keyvault_enabled_for_disk_encryption
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = each.value.keyvault_soft_delete_retention_days
  purge_protection_enabled    = each.value.keyvault_purge_protection_enabled

  sku_name = each.value.keyvault_sku_name

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Create",
      "Get",
    ]

    secret_permissions = [
      "Set",
      "Get",
      "Delete",
      "Purge",
      "Recover"
    ]
  }
}