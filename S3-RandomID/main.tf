provider "aws" {
  region            = var.aws_region
}

module "storage1" {
  source            = "./storage"
  project_name      = var.project_name
}
