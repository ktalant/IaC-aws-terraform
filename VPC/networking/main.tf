provider "aws" {
  region = var.aws_region
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

resource "aws_internet_gateway" "talant_igw" {
  vpc_id = aws_vpc.talant_vpc.id

  tags = {
    Name = var.igw_tag
  }
}
