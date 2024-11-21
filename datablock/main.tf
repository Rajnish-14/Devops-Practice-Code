resource "azurerm_resource_group" "rg-block" {
  name     = "rg1"
  location = "west europe"
}

resource "azurerm_virtual_network" "vnet-block" {
  name                = "dev-vnet"
  location            = "west europe"
  resource_group_name = "rg1"
  address_space       = ["10.0.0.0/16"]
}
resource "azurerm_subnet" "subnet-block" {
  name                 = "frontendsubnet"
  resource_group_name  = "rg1"
  virtual_network_name = "dev-vnet"
  address_prefixes     = ["10.0.1.0/24"]
}
resource "azurerm_network_interface" "nic-block" {
  name                = "main-nic"
  location            = "westeurope"
  resource_group_name = "rg1"

  ip_configuration {
    name                          = "ip-nic"
    subnet_id                     = data.azurerm_subnet.subnet-dadablock.id
    private_ip_address_allocation = "dynamic"
  }
}
resource "azurerm_linux_virtual_machine" "myvm" {
  name                  = "frontendvm"
  location              = "westeurope"
  resource_group_name   = "rg1"
  size                  = "Standard_F2"
  network_interface_ids = azurerm_network_interface.nic-block.id
  admin_username        = data.azurerm_key_vault_secrets.userid-data.name
  admin_password        = data.azurerm_key_vault_secrets.password-data.id

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}
