module "network" {
  source   = "./modules/network"
  vpc_cidr = var.vpc_cidr
  azs      = var.azs
}

module "compute" {
  source           = "./modules/compute"
  vpc_id           = module.network.vpc_id
  subnet_id        = module.network.subnet_ids[0]
  ami_id           = var.ami_id
  instance_type    = var.instance_type
  bastion_cidr     = var.bastion_cidr
  public_key_path  = var.public_key_path
}

module "database" {
  source      = "./modules/database"
  subnet_ids  = module.network.subnet_ids
  db_name     = var.db_name
  db_user     = var.db_user
  db_password = var.db_password
  sg_id       = module.compute.sg_id
}