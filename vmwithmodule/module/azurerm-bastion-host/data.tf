data "azurerm_public_ip" "data-publicip" {
  for_each            = var.bastion
  name                = each.value.publicip-name
  resource_group_name = each.value.resource_group_name
}
