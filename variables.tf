variable "project_name" {
  type    = string
  default = "Project-convert-github"
}

variable "project_description" {
  type    = string
  default = "Converted to Git-backed Config-as-Code using Terraform."
}

variable "space_name" {
  type    = string
  default = "Default"
}

variable "project_group_name" {
  type    = string
  default = "Infrastructures"
}

variable "lifecycle_name" {
  type    = string
  default = "Standard Promotion"
}

variable "git_username" {
  type = string
  default = "tecknosap@gmail.com"
}

variable "git_password" {
  type = string
}

variable "repo_url" {
  type    = string
  default = "https://github.com/tecknosap/oc-project.git"
}

variable "default_branch" {
  type    = string
  default = "master"
}

variable "api_key" {
  description = "Octopus Deploy API Key"
  type        = string
  sensitive   = true
}

