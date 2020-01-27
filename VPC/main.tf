provider "aws" {
  region = "eu-west-3"
}

module "vpc-paris" {
  source        = "./networking"
  vpc_cidr      = var.vpc_cidr
  subnet_count  = var.subnet_count
  aws_region    = var.aws_region
  vpc_tag       = var.vpc_tag
  public_cidrs  = var.public_cidrs
  private_cidrs = var.private_cidrs
  accessip      = var.accessip
}
