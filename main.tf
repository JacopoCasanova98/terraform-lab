module "network" {
  source = "./modules/network"

  vpc_cidr            = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  availability_zone   = var.availability_zone
}

module "instance" {
  source = "./modules/instance"

  vpc_id     = module.network.vpc_id
  admin_cidr = var.admin_cidr
  subnet_public_id = module.network.subnet_public_id
  security_group_id = module.network.security_group_id
}