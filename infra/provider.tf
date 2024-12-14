provider "aws" {
  region = var.region
}

terraform {
  cloud { 
    organization = "postech-fiap-alura" 
    workspaces { 
      name = "totem-express" 
    } 
  } 
}