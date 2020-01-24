provider "aws" {
  region = "us-east-1"
  profile = "developer"
}

data "aws_availability_zones" "azs" {}

resource "aws_vpc" "talant_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = var.vpc_tag
  }
}
