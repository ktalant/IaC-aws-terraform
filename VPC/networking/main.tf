# Define provider
provider "aws" {
  region = var.aws_region
}

# fetch availability zones
data "aws_availability_zones" "azs" {}

# create a new VPC
resource "aws_vpc" "talant_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = var.vpc_tag
  }
}

# create a new IGW and attach to created VPC
resource "aws_internet_gateway" "talant_igw" {
  vpc_id = aws_vpc.talant_vpc.id

  tags = {
    Name = var.igw_tag
  }
}

# create a new public route table and attach internet gateway
resource "aws_route_table" "talant_public_rt" {
  vpc_id = aws_vpc.talant_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.talant_igw.id
  }

  tags = {
    Name = var.public_rt_tag
  }
}

resource "aws_default_route_table" "talant_private_rt" {
  default_route_table_id  = aws_vpc.talant_vpc.default_route_table_id

  tags = {
    Name = var.private_rt_tag
  }
}
