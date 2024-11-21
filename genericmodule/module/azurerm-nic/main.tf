resource "azurerm_network_interface" "nic-vm-dev" {
  for_each            = var.vm-nic
  name                = each.value.nic_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location

  ip_configuration {
    name                          = each.value.ip_configuration_name
    subnet_id                     = data.azurerm_subnet.subnet-data[each.key].id
    private_ip_address_allocation = each.value.private_ip_address_allocation
  }
}