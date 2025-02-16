terraform {
  cloud {
    organization = "postech-fiap-alura"
    workspaces {
      name = "totem-express"
    }
  }
}