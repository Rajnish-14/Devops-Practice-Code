resource "azurerm_bastion_host" "bastions" {
  for_each            = var.module-bastion
  name                = each.value.bastion_name
  location            = each.value.bastion_location
  resource_group_name = each.value.bastion_rg

  ip_configuration {
    name                 = "configuration"
    subnet_id            = data.azurerm_subnet.subnet_data.id
    public_ip_address_id = data.azurerm_public_ip.PIP_data.id
  }
}
