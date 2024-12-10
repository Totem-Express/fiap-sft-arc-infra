variable "prefix" {
  type    = string
  default = "totem_express"
}

variable "cluster_name" {
  type    = string
  default = "8soat"
}

variable "instance_types" {
  type    = list(string)
  default = ["t3a.medium"]
}

variable "subnet_count" {
  type    = number
  default = 2
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}


variable "policy_arn" {
  type    = string
  default = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
}

variable "region" {
  type        = string
  description = "AWS Region"
  default     = "us-east-1"
}

variable "authentication_mode" {
  description = "The authentication mode for the cluster. Valid values are `CONFIG_MAP`, `API` or `API_AND_CONFIG_MAP`"
  type        = string
  default     = "API_AND_CONFIG_MAP"
}

variable "principal_arn" {
  type    = string
  default = "arn:aws:iam::924978846501:role/voclabs"
}