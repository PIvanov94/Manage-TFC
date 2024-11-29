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

# Create CLI-driven workspaces
resource "tfe_workspace" "cli_workspaces" {
  for_each          = toset(var.workspace_names)
  name              = each.key
  organization      = var.organization
  project_id        = var.project_id
  terraform_version = "1.9.8"
}
