resource "azurerm_network_interface" "rkg-nic" {
  for_each            = var.nic-variable
  name                = each.value.nic_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location

  ip_configuration {
    name                          = each.value.ipconfig_name
    subnet_id                     = data.azurerm_subnet.data-subnet[each.key].id
    private_ip_address_allocation = each.value.nic_privateip_address_location
  }
}
