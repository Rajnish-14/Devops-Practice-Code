resource "azurerm_resource_group" "rgsforvm" {
  name     = "rajnish-rg-vm"
  location = "central india"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-vm"
  resource_group_name = azurerm_resource_group.rgsforvm.name
  location            = "central india"
  address_space       = ["10.1.0.0/16"]
}

resource "azurerm_subnet" "name" {
  name                 = "frontend-subnet"
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name  = azurerm_resource_group.rgsforvm.name
  address_prefixes     = ["10.1.1.0/24"]

}
variable "nic-frontend" {
  type = map(any)

}
resource "azurerm_network_interface" "vmnic" {
  for_each            = var.nic-frontend
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "frontend-ip"
    subnet_id                     = data.azurerm_subnet.subnet-data[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}

data "azurerm_subnet" "subnet-data" {
  for_each             = var.nic-frontend
  name                 = each.value.subnet_name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
}

resource "azurerm_linux_virtual_machine" "vms" {
  for_each                        = var.nic-frontend
  name                            = each.value.virtual_machine_name
  location                        = each.value.location
  resource_group_name             = each.value.resource_group_name
  size                            = each.value.size
  admin_username                  = data.azurerm_key_vault_secret.username.value
  admin_password                  = data.azurerm_key_vault_secret.password.value
  network_interface_ids           = [azurerm_network_interface.vmnic[each.key].id]
  disable_password_authentication = false

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
