variable "prefix" {
  type    = string
  default = "totem_express"
}

variable "ecr_order_product_registry" {
  type = string
  default = "totem_express_order_product"
}

variable "ecr_payments_registry" {
  type = string
  default = "totem_express_payments"
}

variable "ecr_users_registry" {
  type = string
  default = "totem_express_users"
}

variable "cluster_name" {
  type    = string
  default = "8soat"
}

variable "instance_types" {
  type    = list(string)
  default = ["t3a.medium"]
}

variable "vpc_id" {
  type = string
}

variable "subnets_ids" {
  type = list(string)
}

variable "ssh_security_group_id" {
  type = string
}


variable "policy_arn" {
  type    = string
  default = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
}

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "authentication_mode" {
  type    = string
  default = "API_AND_CONFIG_MAP"
}

variable "principal_arn" {
  type    = string
  default = "arn:aws:iam::924978846501:role/voclabs"
}