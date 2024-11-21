resource "azurerm_subnet" "rkg-subnet"{
    for_each=var.subnet-variable
    name = each.value.subnet_name
    resource_group_name = each.value.resource_group_name
    address_prefixes=each.value.subnet_address_prefixes
    virtual_network_name = each.value.vnet_name
}