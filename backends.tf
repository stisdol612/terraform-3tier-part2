# --- root/backends.tf ---

terraform {
  cloud {
    organization = "smt-terraform"

    workspaces {
      name = "smt-3tier-vpc"
    }
  }
}