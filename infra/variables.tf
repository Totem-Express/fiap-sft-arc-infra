variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "db_order_product_version" {
  description = "Database version"
  type        = string
}

variable "db_order_product_instance_name" {
  description = "Database name"
  type        = string
}

variable "db_order_product_username" {
  description = "Database username"
  type        = string
}

variable "db_order_product_password" {
  description = "Database password"
  type        = string
}

variable "db_order_product_instance_class" {
  description = "RDS instance type"
  type        = string
}

variable "db_order_product_allocated_storage" {
  description = "Allocated storage size in GB"
  type        = number
}

variable "db_payments_version" {
  description = "Database version"
  type        = string
}

variable "db_payments_instance_name" {
  description = "Database name"
  type        = string
}

variable "db_payments_username" {
  description = "Database username"
  type        = string
}

variable "db_payments_password" {
  description = "Database password"
  type        = string
}

variable "db_payments_instance_class" {
  description = "RDS instance type"
  type        = string
}

variable "db_payments_allocated_storage" {
  description = "Allocated storage size in GB"
  type        = number
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "eks_principal_arn" {
  type    = string
  default = "arn:aws:iam::924978846501:role/voclabs"
}