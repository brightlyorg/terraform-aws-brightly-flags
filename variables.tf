# Required vars
variable "project_name" {
  type        = string
  description = "Brief name of your project that will utilize feature flags. AWS resources will use this and the github repo's name will be based on this value: brightly-flags-<project_name>"
  # TODO: validate that this is only contains characters suitable for aws resources and github repo names
  # TODO: validate max length?
}

variable "project_description" {
  type        = string
  description = "Description of your project that will utilize feature flags."
  default     = ""
}

variable "environments" {
  type = map(object({
    name        = string
    description = string
  }))
  description = "The set of environments to create. Fields include: name, description"
  default = {
    "dev" = {
      name        = "dev"
      description = "Development environment"
    },
    "prod" = {
      name        = "prod"
      description = "Production environment"
    }
  }
}


# Optional vars:
variable "aws_lightsail_container_power" {
  type        = string
  description = "The power of the lightsail container service running ld-relay. Options are nano, micro, small, medium, large, xlarge"
  default     = "nano"
  # TODO: validate that this is one of the valid options
}

variable "ld_relay_log_level" {
  type        = string
  description = "The log level for the LaunchDarkly relay. It must match one of the level names 'debug', 'info', 'warn', or 'error' (case-insensitive)."
  default     = "info"
  # TODO: validate that this is one of the valid options
}

variable "github_repo_description" {
  type        = string
  description = "The description of the project that will utilize feature flags. This will be used as the description of the github repository"
  default     = "Brightly Feature Flags for your project"
}

variable "github_repo_private" {
  type        = bool
  description = "Whether the github repository should be private or public. You probably want this to be private"
  default     = true
}

# More optional vars that you should probably only change if you know what you're doing:
variable "brightly_docker_image_tag" {
  type        = string
  default     = "0.0.6" # https://hub.docker.com/r/drichelson/brightly/tags
  description = "The docker image tag to use for the brightly backend service. See https://hub.docker.com/r/drichelson/brightly/tags for available tags."
}

variable "brightly_version" {
  type        = string
  default     = "v0.8.0" # latest tags: https://github.com/brightlyorg/brightly/tags
  description = "The version of the brightly binary to use. This can be any valid git tag, branch, or commit hash from https://github.com/brightlyorg/brightly"
}

