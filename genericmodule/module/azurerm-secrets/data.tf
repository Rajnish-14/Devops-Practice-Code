data "azurerm_key_vault" "keyvault-data" {
  for_each            = var.secrets-data
  name                = each.value.key_vault_name
  resource_group_name = each.value.resource_group_name
}
