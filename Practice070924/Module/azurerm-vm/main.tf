resource "random_password" "kv-password" {
    for_each = var.vm-var
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}
resource "azurerm_key_vault_secret" "rkg-kv-secret" {
  for_each = var.vm-var
  name = "${each.value.vm_name}-password"
  value= random_password.kv-password[each.key].result
  key_vault_id = data.azurerm_key_vault.data-kv[each.key].id
}

resource "azurerm_linux_virtual_machine" "rkg-vm" {
  for_each              = var.vm-var
  name                  = each.value.vm_name
  location              = each.value.location
  resource_group_name   = each.value.resource_group_name
  admin_username        = each.value.vm_name
  admin_password        = azurerm_key_vault_secret.rkg-kv-secret[each.key].value
  network_interface_ids = [data.azurerm_network_interface.data-nic[each.key].id]
  size                  = each.value.vm_size
  disable_password_authentication = false

  os_disk {
    caching              = each.value.vm_caching
    storage_account_type = each.value.vm_storage_type
  }
  source_image_reference {
    publisher = each.value.vm_publisher
    offer     = each.value.vm_offer
    sku       = each.value.vm_sku
    version   = each.value.vm_version
  }
}
