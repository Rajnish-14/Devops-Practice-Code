data "azurerm_subnet" "data-subnet"{
    for_each=var.var-bastion
    name = each.value.subnet_name
    resource_group_name = each.value.resource_group_name
    virtual_network_name = each.value.vnet_name
}
data "azurerm_public_ip" "data-pip"{
    for_each = var.var-bastion
    name = each.value.pip_name
    resource_group_name = each.value.resource_group_name
}