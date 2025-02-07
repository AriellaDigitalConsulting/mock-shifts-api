terraform {
  required_providers {
    render = {
      source = "render-oss/render"
      version = "1.4.0"
    }
  }
}

provider "render" {
}

resource "render_web_service" "express_app" {
  start_command = "npm start"

  runtime_source = {
    native_runtime = {
      repo_url      = var.repo_url
      branch        = var.branch
      build_command = "npm install"
      auto_deploy   = true
      runtime       = "node"
      exclude_files = [".terraform/**", "*.tf", ".env"]
    }
  }

  name    = var.service_name
  region  = var.region
  plan    = "starter"
}
