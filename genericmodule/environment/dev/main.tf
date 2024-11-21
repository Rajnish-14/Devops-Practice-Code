module "vm-rg" {
  source = "../../module/azurerm-resourece-group"
  rgvar  = var.module-rg
}
module "vm-storage" {
  source     = "../../module/azurerm-storageaccount"
  vm-storage = var.module-storage
  depends_on = [module.vm-rg]
}
module "vm-container" {
  source       = "../../module/azurerm-container"
  vm-container = var.module-container
  depends_on   = [module.vm-storage]
}
module "vm-vnet" {
  source     = "../../module/azurerm-vnet"
  vnet-var   = var.module-vnet
  depends_on = [module.vm-rg]
}
module "vm-subnet" {
  source     = "../../module/azurerm-subnet"
  subnet-var = var.module-subnet
  depends_on = [module.vm-vnet]
}
module "vm-nic" {
  source     = "../../module/azurerm-nic"
  vm-nic     = var.module-nic
  depends_on = [module.vm-subnet]
}
module "vm-public-ip" {
  source     = "../../module/azurerm-public-ip"
  vm-public  = var.module-pip
  depends_on = [module.vm-rg]
}
module "vm-bastion-host" {
  source     = "../../module/azurerm-bastion-host"
  bastion    = var.module-bastion
  depends_on = [module.vm-subnet, module.vm-public-ip]
}
module "vm-main" {
  source     = "../../module/azurerm-virtual-machine"
  vm-var     = var.module-vm
  depends_on = [module.vm-nic, module.vm-keyvault]
}
module "vm-keyvault" {
  source      = "../../module/azurerm-keyvault"
  keyvault-vm = var.module-keyvault
  depends_on  = [module.vm-rg]
}
module "vm-secret" {
  source       = "../../module/azurerm-secrets"
  secrets-data = var.module-secret
  depends_on   = [module.vm-keyvault]
}
