terraform {
  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "~> 0.60.1"
    }
  }
}

provider "tfe" {
  hostname = "app.terraform.io"
  token    = var.tfe_token # API Token
}


resource "tfe_project" "second-project" {
  organization = var.organization
  name         = var.project_name
  description  = var.project_description
}
