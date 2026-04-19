resource "octopusdeploy_git_credential" "app" {
  name     = "GitHub convert"
  username = var.git_username
  password = var.git_password
}

resource "octopusdeploy_project" "project" {
  # MUST MATCH IMPORT COMMAND:
  # terraform import octopusdeploy_project.project Projects-114

  name        = var.project_name
  description = var.project_description

  space_id         = local.space_ids[var.space_name]
  project_group_id = local.project_group_ids[var.project_group_name]
  lifecycle_id     = local.lifecycle_ids[var.lifecycle_name]

  is_version_controlled = true

  git_library_persistence_settings {
    git_credential_id = octopusdeploy_git_credential.app.id
    url               = var.repo_url
    default_branch    = var.default_branch

    # Updated for your new project name
    base_path         = ".octopus/${var.project_name}"

    protected_branches = []
  }

#   included_library_variable_sets = [
#     for name in var.variable_set_names :
#     local.variable_set_ids[name]
#   ]
}
