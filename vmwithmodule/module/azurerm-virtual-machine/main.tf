resource "azurerm_linux_virtual_machine" "vm-block-dev" {
  for_each                        = var.vm-var
  name                            = each.value.vm_name
  location                        = each.value.location
  resource_group_name             = each.value.resource_group_name
  size                            = each.value.vm_size
  admin_username                  = ""
  admin_password                  = ""
  disable_password_authentication = each.value.disable_password_authentication
  network_interface_ids           = [data.azurerm_network_interface.nic-data[each.value].id]

  os_disk {

    caching              = each.value.vm_caching
    storage_account_type = each.value.vm_storage_account_type

  }
  source_image_reference {
    publisher = each.value.vm_publisher
    sku       = each.value.vm_sku
    offer     = each.value.vm_offer
    version   = each.value.vm_version
  }
}

