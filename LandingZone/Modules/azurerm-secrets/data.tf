data "azurerm_key_vault" "kv-data" {
  for_each            = var.module-secrets
  name                = each.value.kvdata-name
  resource_group_name = each.value.rg_name
}
