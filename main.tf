provider "aws" {
  region                = "us-east-1"
}

module "iam" {
  source = "./IAM"
}

module "vpc" {
  source = "./VPC"
}


