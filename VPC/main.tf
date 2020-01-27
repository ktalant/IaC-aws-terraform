provider "aws" {
  region = "us-east-1"
}

module "vpc-paris" {
  source        = "./networking"
  vpc_cidr      = var.vpc_cidr
  aws_region    = var.useast1
  vpc_tag       = var.vpc_tag
  public_cidrs  = var.public_cidrs
  private_cidrs = var.private_cidrs
}
