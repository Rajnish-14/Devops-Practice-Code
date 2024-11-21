module "resource-group-mod" {
  source = "../../module/rg"
  dev-rg = var.rg-module
}

module "storage-mod" {
  source              = "../../module/storage account"
  dev-storageaccount = var.storage-module
}

# module "sg-container-mod" {
#   source = "../../module/container"
#   containerdev = var.sg-container
# }
