provider "render" {
}

resource "render_web_service" "express_app" {
  runtime_source = {
    native_runtime = {
      repo_url      = var.repo_url
      branch        = var.branch
      build_command = "npm install"
      start_command = "node index.js"
      auto_deploy   = true
      runtime       = "node"
      exclude_files = [".terraform/**", "*.tf", ".env"]
    }
  }

  name    = var.service_name
  region  = var.region
  plan    = "starter"  # Choose the plan that suits your needs
}
