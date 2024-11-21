module "rg" {
  source = "../../module/Resource Group"
  rg_variavble = var.rg_module
}
module "storage" {
depends_on = [ module.rg ]
  source = "../../module/Storage account"
  srg_variable = var.storage_module
}