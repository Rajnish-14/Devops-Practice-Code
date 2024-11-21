resource "azurerm_public_ip" "rkg-pip" {
  for_each            = var.pip-var
  name                = each.value.pip_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  allocation_method   = each.value.pip_allocation_method
}
