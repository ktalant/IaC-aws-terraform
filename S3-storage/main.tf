provider "aws" {
  region = "us-east-1"
}

module "storage-east1" {
  source       = "./storage"
  bucket_name = var.bucket_name
  aws_region   = var.useast1
}

module "storage-east2" {
  source       = "./storage"
  bucket_name = var.bucket_name
  aws_region   = var.useast2
}

module "storage-west1" {
  source       = "./storage"
  bucket_name = var.bucket_name
  aws_region   = var.uswest1
}
