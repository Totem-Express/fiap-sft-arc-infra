module "prod" {
  source = "../infra"

  prefix       = "totem_express"
  cluster_name = "8soat"
  region       = "us-east-1"
}

terraform { 
  cloud { 
    organization = "postech-fiap-alura" 
    workspaces { 
      name = "totem-express" 
    } 
  } 
}