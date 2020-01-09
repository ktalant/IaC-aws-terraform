provider "aws" {
  region            = var.aws_region
}

data "aws_vpc" "my_vpc" {
  id = var.vpc_id
}

resource "aws_subnet" "public_sub1" {
  vpc_id                    = data.aws_vpc.my_vpc.id
  availability_zone         = var.az1
  cidr_block                = var.public1_cidr
  map_public_ip_on_launch   = true

  tags = {
      Name                  = "public1"
  }
}
resource "aws_subnet" "public_sub2" {
  vpc_id                    = data.aws_vpc.my_vpc.id
  availability_zone         = var.az2
  cidr_block                = var.public2_cidr
  map_public_ip_on_launch   = true

  tags = {
      Name                  = "public2"
  }
}

resource "aws_subnet" "public_sub3" {
  vpc_id                    = data.aws_vpc.my_vpc.id
  availability_zone         = var.az3
  cidr_block                = var.public3_cidr
  map_public_ip_on_launch   = true

  tags = {
      Name                  = "public3"
  }
}


