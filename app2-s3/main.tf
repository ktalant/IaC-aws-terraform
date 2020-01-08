provider "aws" {
  region        = var.aws_region
}

module "app2" {
  source = "./module"
  app2_s3_bucket    = var.app2_s3_bucket
}

