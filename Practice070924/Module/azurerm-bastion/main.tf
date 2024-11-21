resource "azurerm_bastion_host" "rkg-bastion" {
  for_each            = var.var-bastion
  name                = each.value.bastion_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                 = each.value.ipconfig_bastion_name
    subnet_id            = data.azurerm_subnet.data-subnet[each.key].id
    public_ip_address_id = data.azurerm_public_ip.data-pip[each.key].id
  }
}
