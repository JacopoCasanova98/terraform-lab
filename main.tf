module "network" {
  source = "./modules/network"

  vpc_cidr            = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  availability_zone   = var.availability_zone
}

module "instance" {
  source = "./modules/instance"

  vpc_id                = module.network.vpc_id
  admin_cidr            = var.admin_cidr
  subnet_id             = module.network.subnet_public_id
  instance_profile_name = module.iam.instance_profile_name
}

module "storage" {
  source = "./modules/storage"

  tags        = var.tags
  bucket_name = var.storage_bucket_name
}

module "iam" {
  source = "./modules/iam"

  bucket_arn  = module.storage.bucket_arn
  kms_key_arn = module.storage.kms_key_arn
}