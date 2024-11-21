resource "azurerm_resource_group" "rg-vm" {
  name = "rg-dev"
  location= "westeurope"
}

resource "azurerm_virtual_network" "vm-block" {
  name= "dev-vnet"
  location= "westeurope"
  resource_group_name = azurerm_resource_group.rg-vm.name
  address_space = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "subnet1-block" {
  name = "frontend"
#   location= "westeurope"
  resource_group_name = azurerm_resource_group.rg-vm.name
  virtual_network_name = azurerm_virtual_network.vm-block.name
  address_prefixes = ["10.0.1.0/24"]
}

resource "azurerm_public_ip" "publicip-block" {
  name = "dev-public-ip"
  location = "westeurope"
  resource_group_name = "rg-dev"
  allocation_method = "Static"
}

resource "azurerm_network_interface" "nic-block" {
  name                = "dev-nic"
  location            = "westeurope"
  resource_group_name = "rg-dev"

  ip_configuration {
    name                          = "dev-nic-ip"
    subnet_id                     = "/subscriptions/efe9bd78-747e-4f33-ad88-37135fa7db74/resourceGroups/rg-dev/providers/Microsoft.Network/virtualNetworks/dev-vnet/subnets/frontend"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.publicip-block.id
  }
}

resource "azurerm_linux_virtual_machine" "vm-block" {
  name                  = "frontend-vm"
  location              = "westeurope"
  resource_group_name   = "rg-dev"
  admin_username      = "adminuser"
  admin_password= "Admin@1234"
  network_interface_ids = [azurerm_network_interface.nic-block.id]
  size                = "Standard_F2"
  disable_password_authentication= "false"

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}