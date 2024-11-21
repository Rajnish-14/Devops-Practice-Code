resource "azurerm_network_interface" "nics" {
  for_each            = var.module-nic
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.rg_name

  ip_configuration {
    name                          = each.value.ipconfig_name
    subnet_id                     = data.azurerm_subnet.subnet_data.id
    private_ip_address_allocation = each.value.pipaallocation
  }
}
