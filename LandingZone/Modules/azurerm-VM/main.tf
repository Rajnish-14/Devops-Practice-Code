resource "azurerm_linux_virtual_machine" "vms" {
  for_each              = var.module-vm
  name                  = each.value.vm_name
  location              = each.value.vm_location
  resource_group_name   = each.value.vm_rg_name
  size                  = each.value.vm_size
  admin_username        = ""
  admin_password        = data.azurerm_key_vault_secret.data-secrets.value
  network_interface_ids = data.azurerm_network_interface.data-nic.id

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Satndard"
  }
  source_image_reference {
    publisher = "canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
}
}