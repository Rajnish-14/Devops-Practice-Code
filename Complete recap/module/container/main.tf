# resource "azurerm_storage_container" "backendcontainer" {
#     for_each = var.containerdev
#   name = each.value.name
#   storage_account_name = each.value.storage_account_name

# }