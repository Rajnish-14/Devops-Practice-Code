resource "azurerm_virtual_network" "rkg-vnet"{
    for_each = var.vnet
    name= each.value.vnet_name
    location = each.value.location
    resource_group_name= each.value.resource_group_name
    address_space= each.value.vnet_address_space
}