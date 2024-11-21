# variable "rg-optional" {
#   type = map(string)
# }
# variable "rg-optional1"{
# type =map(list(string))
# }
variable "rg-optional12"{
type =map(object({

    name=string
    location=string
    tags= optional(map(string))
}
))
}


resource "azurerm_resource_group" "rgs" {
  for_each = var.rg-optional12
  name     = each.value.name
  location = each.value.location
  tags=each.value.tags
}

# resource "azurerm_resource_group" "rgs1" {
# for_each = var.rg-optional1
#   name     = each.value.name
#   location = each.value.loation
# }
# resource "azurerm_resource_group" "rgs2" {
# for_each = var.rg-optional12
#   name     = each.value.name
#   location = each.value.loation
#   tags = each.value.tags
# }




# terraform dyanmic block

# variable "dynamic-bl" {

# }
# resource "azurerm_virtual_network" "vnet" {
#   name                = "evirtual-network"
#   location            = "east us"
#   resource_group_name = "rg1"
#   address_space       = ["10.0.0.0/16"]

#   dynamic "subnet" {
#     for_each = var.dynamic-bl
#     content {
#       name             = subnet.value.name
#       address_prefixes = subnet.value.address_prefixes
#     }

#   }

#   tags = {
#     environment = "Production"
#   }
# }
