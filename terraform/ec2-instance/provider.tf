terraform {
  required_version = ">=1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.70.0"
    }
    github = {
      source  = "integrations/github"
      version = "4.19.0"
    }
  }
}

provider "aws" {
  shared_credentials_file = var.cred_file
  region                  = var.region
}

provider "github" {
  token = var.github_token
  owner = var.github_owner
}
