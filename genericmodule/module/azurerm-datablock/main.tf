# data "azurerm_public_ip" "data-publicip" {
#     for_each = var.data-variable
#   name                = each.value.publicip-name
#   resource_group_name = each.value.resource_group_name
# }

# data "azurerm_subnet" "subnet-data" {
#   for_each             = var.data-variable
#   name                 = each.value.subnet_name
#   resource_group_name  = each.value.resource_group_name
#   virtual_network_name = each.value.virtual_network_name
# }
# data "azurerm_key_vault" "keyvault-data" {
#     for_each = var.data-variable
#   name = each.value.key_vault_name
#   resource_group_name = each.value.resource_group_name
# }
