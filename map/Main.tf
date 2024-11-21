resource "azurerm_resource_group" "rgs" {
for_each = tomap({
rg1="westus"
rg2="eastus"
rg3="west india"
})
  name = each.key
  location = each.value
}