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

  principal_arn         = var.eks_principal_arn
  vpc_id                = module.vpc.vpc_id
  subnets_ids           = module.vpc.subnets_ids
  ssh_security_group_id = module.vpc.ssh_security_group_id
}

module "db" {
  source = "./db"

  vpc_id               = module.vpc.vpc_id
  subnets_ids          = module.vpc.subnets_ids
  vpc_cidr             = module.vpc.vpc_cidr
  db_order_product_username          = var.db_order_product_username
  db_order_product_password          = var.db_order_product_password
  db_order_product_instance_name     = var.db_order_product_instance_name
  db_order_product_instance_class    = var.db_order_product_instance_class
  db_order_product_allocated_storage = var.db_order_product_allocated_storage
  db_order_product_version           = var.db_order_product_version
  db_payments_username          = var.db_payments_username
  db_payments_password          = var.db_payments_password
  db_payments_instance_name     = var.db_payments_instance_name
  db_payments_instance_class    = var.db_payments_instance_class
  db_payments_allocated_storage = var.db_payments_allocated_storage
  db_payments_version           = var.db_payments_version
}

terraform {
  cloud {
    organization = "postech-fiap-alura"
    workspaces {
      name = "totem-express"
    }
  }
}