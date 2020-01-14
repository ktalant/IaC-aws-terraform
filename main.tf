provider "aws" {
  region                = var.my_region
}

module "iam" {
  source = "./IAM"
}

module "vpc" {
  source = "./VPC"
}


