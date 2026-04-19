terraform {
  required_providers {
    octopusdeploy = {
      source  = "OctopusDeploy/octopusdeploy"
      version = ">= 0.43, <= 1.10.3"
    }
  }
}

provider "octopusdeploy" {
  address = "https://tecknosap.octopus.app"
  api_key = var.api_key
}


