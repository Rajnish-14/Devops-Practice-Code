resource "azurerm_resource_group" "rg_block" {
for_each = var.rg-block-mod
name = each.key
location = each.value
}