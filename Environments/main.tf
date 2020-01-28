provider "aws" {
  region = "us-east-1"
}

module "storage1" {
  source       = "./storage"
  bucket_name = var.bucket_name
  aws_region   = var.aws_region
}
