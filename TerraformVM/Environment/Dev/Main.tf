module "rg-mod" {
  source      = "../../Module/RG"
  rg-variable = var.dev-rg
}
module "vnet-mod" {
  source     = "../../Module/Vnet"
  vm_vnet    = var.dev-vnet
  depends_on = [module.rg-mod]
}
module "subnet-mod" {
  source     = "../../Module/subnet"
  vm-subnet  = var.dev-subnet
  depends_on = [module.vnet-mod, module.rg-mod]
}
module "nic-mod" {
  depends_on = [module.rg-mod, module.subnet-mod]
  source     = "../../Module/NIC"
  nic_variable    = var.dev-nic
}
module "vm-mod" {
  depends_on  = [module.nic-mod, module.rg-mod]
  source      = "../../Module/VM"
  VM-variable = var.dev-vm
}
