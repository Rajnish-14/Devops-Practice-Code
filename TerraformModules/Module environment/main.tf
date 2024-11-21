module "rg-block" {
  source = "../Resourcegroup"
  rg-block-mod = var.rg-details
}
module "storage-block"{
    depends_on = [ module.rg-block ]
    source = "../Storage account"
 storage-account-block = var.storage-details
}