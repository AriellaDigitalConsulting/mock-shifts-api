variable "repo_url" {
  description = "URL of the Git repository containing the Express.js application"
  type        = string
}

variable "service_name" {
  description = "Name of the Render service"
  type        = string
  default     = "express-mock-api"
}

variable "branch" {
  description = "Branch to deploy"
  type        = string
  default     = "main"
}

variable "region" {
  description = "Render region to deploy to"
  type        = string
  default     = "oregon"  # Change based on your preference
}
