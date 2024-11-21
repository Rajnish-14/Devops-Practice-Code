resource "azurerm_resource_group" "rgs12" {
  name= "rg1234"
  location = "westus"
}

resource "azurerm_virtual_network" "vnet-block" {
    name = "dev-vnet1"
    location = "westus"
    resource_group_name = azurerm_resource_group.rgs12.name
    address_space = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "subnets-dev" {
    name = "dev-subnet"
    resource_group_name = azurerm_resource_group.rgs12.name
    virtual_network_name = azurerm_virtual_network.vnet-block.name
    address_prefixes = ["10.0.1.0/24"] 
}

resource "azurerm_network_interface" "nic-dev" {
  name = "dev-nic"
  location = "westus"
  resource_group_name = "rg1"

  ip_configuration {
    name = "ipsubnet"
    subnet_id = ""
    private_ip_address_allocation = "Dyanamic"

  }
}