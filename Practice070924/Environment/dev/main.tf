module "rg" {
  source      = "../../Module/azurerm-rg"
  rg-variable = var.module-rg
}
module "vnet" {
  source     = "../../Module/azurerm-vnet"
  vnet       = var.module-vnet
  depends_on = [module.rg]
}
module "subnet" {
  source          = "../../Module/azurerm-Subnet"
  subnet-variable = var.module-subnet
  depends_on      = [module.vnet]
}
module "nic" {
  source       = "../../Module/azurerm-nic"
  nic-variable = var.module-nic
  depends_on   = [module.subnet]
}
module "pip" {
  source     = "../../Module/azurerm-pip"
  pip-var    = var.module-pip
  depends_on = [module.rg]
}
module "kv" {
  source     = "../../Module/azurerm-keyvault"
  var-kv     = var.module-kv
  depends_on = [var.module-kv]
}
module "bastion" {
  source      = "../../Module/azurerm-bastion"
  var-bastion = var.module-bastion
  depends_on  = [module.pip,module.subnet]
}
module "vm" {
  source     = "../../Module/azurerm-vm"
  vm-var     = var.module-vm
  depends_on = [module.nic, module.kv]
}