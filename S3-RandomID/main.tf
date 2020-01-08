provider "aws" {
  region            = var.aws_region
}

module "storage1" {
  source            = "./storage"
  project_name1      = var.project_name1
  project_name2      = var.project_name2
}
