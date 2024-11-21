resource "azurerm_network_interface" "main" {
  for_each            = var.nic_variable
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = "/subscriptions/efe9bd78-747e-4f33-ad88-37135fa7db74/resourceGroups/vm-rg/providers/Microsoft.Network/virtualNetworks/mainvnet/subnets/internal"
    private_ip_address_allocation = "Dynamic"
  }
}
