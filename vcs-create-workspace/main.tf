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
  token    = var.tfe_token
}


# Fetch the existing project by name
data "tfe_project" "target_project" {
  organization = var.organization
  name         = var.project_name
}

# Create the VCS-driven workspace
resource "tfe_workspace" "vcs_workspace" {
  name              = var.workspace_name
  organization      = var.organization
  project_id        = var.project_id
  terraform_version = "1.9.8"

  vcs_repo {
    identifier         = var.vcs_repo_identifier
    branch             = var.branch
    oauth_token_id     = var.oauth_token_id
    ingress_submodules = true # Set to true if the repo uses submodules
  }
}
