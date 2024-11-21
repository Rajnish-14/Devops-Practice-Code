resource "azurerm_public_ip" "publicip-vm" {
    for_each = var.vm-public
   name                = each.value.publicip_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  allocation_method   = each.value.allocation_method
  sku                 = each.value.publicip_sku
  
}