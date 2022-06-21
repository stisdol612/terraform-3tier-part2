# --- root/week22.tf ---

module "vpc" {
  source = "./modules/networking"
  vpc_id = var.vpc_id
  public_subnet_az1 = var.public_subnet_az1
  public_subnet_az2 = var.public_subnet_az2
  private_app_subnet_az1 = var.private_app_subnet_az1
  private_app_subnet_az2 = var.private_app_subnet_az2
  web_security_group = var.web_security_group
  lb_security_group = var.lb_security_group
}

module "compute" {
  source = "./modules/compute"
  vpc_id = module.networking.vpc_id
  public_subnet_az1 = module.networking.public_subnet_az1
  public_subnet_az2 = module.networking.public_subnet_az2
  private_app_subnet_az1 = module.networking.private_app_subnet_az1
  private_app_subnet_az2 = module.networking.private_app_subnet_az2
  web_security_group = module.networking.web_security_group
  lb_security_group = module.networking.lb_security_group
}

