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


