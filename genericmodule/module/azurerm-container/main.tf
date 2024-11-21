resource "azurerm_storage_container" "container-storage" {
  for_each = var.vm-container
  name = each.value.container_name
  storage_account_name = each.value.storage_account_name
}