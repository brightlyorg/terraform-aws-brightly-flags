terraform {
  required_version = ">= 1.8"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.50"
    }
    github = {
      source  = "integrations/github"
      version = ">= 6.0"
    }
  }
}

module "brightly_environment" {
  for_each        = var.environments
  source          = "./brightly_environment"
  project_name    = var.project_name
  env             = each.value
  github_repo     = github_repository.brightly_repo.name
  ld_sdk_endpoint = aws_lightsail_container_service.brightly.url
}