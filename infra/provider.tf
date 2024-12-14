terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
}

# provider "kubernetes" {
#   host                   = data.aws_eks_cluster.totem_express_cluster.endpoint
#   cluster_ca_certificate = base64decode(data.aws_eks_cluster.totem_express_cluster.certificate_authority[0].data)
#   token                  = data.aws_eks_cluster_auth.totem_express_cluster_auth.token
# }

# data "aws_eks_cluster" "totem_express_cluster" {
#   name = "${var.prefix}-${var.cluster_name}"
# }

# data "aws_eks_cluster_auth" "totem_express_cluster_auth" {
#   name = data.aws_eks_cluster.totem_express_cluster.name
# }