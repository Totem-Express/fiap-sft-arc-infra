terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  cloud { 
    organization = "postech-fiap-alura" 
    workspaces { 
      name = "totem-express" 
    } 
  } 
}

provider "aws" {
  region = var.region
}