resource "azurerm_public_ip" "PIPs" {
  for_each            = var.module-PIP
  name                = each.value.PIP_name
  location            = each.value.PIP_location
  resource_group_name = each.value.PIP_rg_name
  allocation_method   = each.value.pip_allocation_method
}
