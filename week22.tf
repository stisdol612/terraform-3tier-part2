# --- root/week22.tf ---

module "networking" {
  source = "./modules/networking"
}

module "compute" {
  source = "./modules/compute"

  vpc_id = module.networking.vpc_id
  public_subnet_az1 = module.networking.public_subnet_az1
  public_subnet_az2 = module.networking.public_subnet_az2
  private_app_subnet_az1 = module.networking.private_app_subnet_az1
  private_app_subnet_az2 = module.networking.private_app_subnet_az2
  web_security_group = module.networking.web_security_group
  alb_security_group = module.networking.alb_security_group
}

