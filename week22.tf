# --- root/week22.tf ---

module "vpc" {
  source = "./modules/networking"
}

module "compute" {
  source = "./modules/compute"
}

