terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "terraform-alura-rlimanogueira"

    workspaces {
      name = "aws-terraform-alura"
    }
  }
}