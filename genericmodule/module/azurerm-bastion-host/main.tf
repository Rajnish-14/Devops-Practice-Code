resource "azurerm_bastion_host" "bastion-block" {
    for_each = var.bastion
  name                = each.value.bastion_host_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                 = each.value.bastion_ip_name
    subnet_id            = data.azurerm_subnet.subnet-data[each.key].id
    public_ip_address_id = data.azurerm_public_ip.data-publicip[each.key].id
  }
}