# oc-project

````markdown
# Octopus Git-Backed Project (Terraform)

## Purpose

This Terraform project is used to take an **existing Octopus Deploy project** and convert it into a **Git-backed (Config-as-Code) project** using a GitHub repository.

It does not create a new project. Instead, it imports and manages an already existing Octopus project and enables version control for its configuration.

---

## What this setup does

- Imports an existing Octopus project (`Projects-114`) into Terraform state  
- Enables Git-based configuration (Config-as-Code) in Octopus  
- Links the project to a GitHub repository  
- Configures project metadata (space, lifecycle, project group)  
- Stores Git credentials securely inside Octopus  

Once enabled, the project configuration is stored and managed through Git instead of only the Octopus UI.

---

## One-time import step

Before Terraform can manage the project, it must be imported:


terraform import octopusdeploy_project.project Projects-114
````

After this, Terraform becomes responsible for managing updates.

---

## Authentication

### Octopus Deploy (Terraform → Octopus)

Terraform uses an API key for authentication:

```powershell
$env:TF_VAR_api_key = "<OCTOPUS_API_KEY>"
```

---

### GitHub (Octopus → Git)

Octopus connects to GitHub using a Personal Access Token (PAT):

```powershell
$env:TF_VAR_git_username = "your-email@example.com"
$env:TF_VAR_git_password = "<GITHUB_PAT>"
```

---

## Repository

```text
https://github.com/tecknosap/oc-project.git
```

---

## Terraform workflow

Standard execution flow:

```bash
terraform init
terraform plan
terraform apply
```

---

## Git-backed configuration path

All Octopus project configuration is stored in the repository under:

```text
.octopus/<project_name>/
```

This becomes the source of truth for Octopus configuration.

---

## Outcome

After successful execution:

* Existing Octopus project is managed through Terraform
* Project is connected to GitHub
* Configuration is version-controlled in Git
* Octopus UI reflects Git-backed state
* Terraform manages structure and linkage only

---

## Notes

* No infrastructure provisioning is performed
* This is strictly configuration management for Octopus
* Secrets are passed via environment variables and not stored in the repository

```
```
