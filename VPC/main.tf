provider "aws" {
  region = var.aws_region
  profile = var.aws_profile
}

module "vpc-talant" {
  source        = "./networking"
  aws_region    = var.aws_region
  aws_profile   = var.aws_profile
  vpc_cidr      = var.vpc_cidr
  subnet_count  = var.subnet_count
  vpc_tag       = var.vpc_tag
  public_cidrs  = var.public_cidrs
  private_cidrs = var.private_cidrs
  accessip      = var.accessip
}
