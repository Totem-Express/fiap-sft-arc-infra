provider "aws" {
  region = var.aws_region
}

data "aws_availability_zones" "available" {}

module "vpc" {
  source = "./shared"

  vpc_cidr = var.vpc_cidr
}

module "app" {
  source = "./app"

  prefix       = "totem_express"
  cluster_name = "8soat"

  vpc_id                = module.vpc.vpc_id
  subnets_ids           = module.vpc.subnets_ids
  ssh_security_group_id = module.vpc.ssh_security_group_id
}

module "db" {
  source = "./db"

  vpc_id               = module.vpc.vpc_id
  subnets_ids          = module.vpc.subnets_ids
  vpc_cidr             = module.vpc.vpc_cidr
  db_password          = var.db_password
  db_instance_name     = var.db_instance_name
  db_instance_class    = var.db_instance_class
  db_allocated_storage = var.db_allocated_storage
  db_version           = var.db_version
  db_username          = var.db_username
}

terraform {
  cloud {
    organization = "postech-fiap-alura"
    workspaces {
      name = "totem-express"
    }
  }
}