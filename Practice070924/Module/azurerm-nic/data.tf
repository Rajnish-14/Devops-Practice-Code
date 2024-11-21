data "azurerm_subnet" "data-subnet"{
    for_each=var.nic-variable
    name = each.value.subnet_name
    resource_group_name = each.value.resource_group_name
    virtual_network_name = each.value.vnet_name
}