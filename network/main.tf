module "network" {
  source = "./modules/network"

  subnet_id         = module.network.private_subnet_id
  security_group_id = module.network.security_group_id
  ami_id         = module.network.ami_id
  instance_type_id = module.network.instance_type_id

}

module "instance" {
  source = "./modules/instance"

  aws_vpc_id         = module.network.vpc_id
  aws_private_subnet_id = module.network.aws_private_subnet_id
  aws_public_subnet_id         = module.network.aws_public_subnet_id
  aws_security_group_id = module.network.security_group_id
  
}