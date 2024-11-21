resource "azurerm_storage_account" "sg-dependency" {
  name                     = "storage1"
  resource_group_name      = "rg-depen"
  location                 = "westus"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  depends_on               = [azurerm_resource_group.rg-depen]
}
resource "azurerm_storage_container" "containersg" {
    name = "container1"
    storage_account_name = azurerm_storage_account.sg-dependency.name  
}