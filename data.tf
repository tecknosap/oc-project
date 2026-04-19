data "octopusdeploy_spaces" "all" {
  take = 1000
}

data "octopusdeploy_lifecycles" "all" {
  take = 1000
}

data "octopusdeploy_project_groups" "all" {
  take = 1000
}

data "octopusdeploy_library_variable_sets" "all" {
  take = 1000
}

locals {
  space_ids = {
    for s in data.octopusdeploy_spaces.all.spaces :
    s.name => s.id
  }

  lifecycle_ids = {
    for l in data.octopusdeploy_lifecycles.all.lifecycles :
    l.name => l.id
  }

  project_group_ids = {
    for g in data.octopusdeploy_project_groups.all.project_groups :
    g.name => g.id
  }

  variable_set_ids = {
    for v in data.octopusdeploy_library_variable_sets.all.library_variable_sets :
    v.name => v.id
  }
}
