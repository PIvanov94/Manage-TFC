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
  token    = var.tfe_token # API token
}

# Fetch the target project
data "tfe_project" "target_project" {
  organization = var.organization
  name         = var.project_name
}

# Fetch the workspaces by name
data "tfe_workspace" "workspaces" {
  for_each     = toset(var.workspace_names)
  organization = var.organization
  name         = each.key
}

# Create a variable set
resource "tfe_variable_set" "variable_set" {
  name         = var.variable_set_name
  organization = var.organization

  # Assign this variable set to the target workspaces
  workspace_ids = [
    for workspace in data.tfe_workspace.workspaces : workspace.id
  ]
}

# Add Terraform variables to the variable set
resource "tfe_variable" "terraform_variables" {
  for_each        = var.terraform_variables
  key             = each.key
  value           = each.value
  category        = "terraform"
  variable_set_id = tfe_variable_set.variable_set.id
  sensitive       = false
}

# Add environment variables to the variable set
resource "tfe_variable" "environment_variables" {
  for_each        = var.environment_variables
  key             = each.key
  value           = each.value
  category        = "env"
  variable_set_id = tfe_variable_set.variable_set.id
  sensitive       = false
}

# Assign the variable set to the project
resource "tfe_project_variable_set" "variable_set_assignment" {
  project_id      = data.tfe_project.target_project.id
  variable_set_id = tfe_variable_set.variable_set.id
}
