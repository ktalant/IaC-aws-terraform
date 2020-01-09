provider "aws" {
  region            = var.aws_region
}

data "aws_vpc" "my_vpc" {
  id = var.vpc_id
}

# ------------------Public-subnet---------------------
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

# ------------------Private-subnet---------------------
resource "aws_subnet" "private_sub1" {
  vpc_id                    = data.aws_vpc.my_vpc.id
  availability_zone         = var.az4
  cidr_block                = var.private1_cidr

  tags = {
      Name                  = "private1"
  }
}

resource "aws_subnet" "private_sub2" {
  vpc_id                    = data.aws_vpc.my_vpc.id
  availability_zone         = var.az5
  cidr_block                = var.private2_cidr

  tags = {
      Name                  = "private2"
  }
}

resource "aws_subnet" "private_sub3" {
  vpc_id                    = data.aws_vpc.my_vpc.id
  availability_zone         = var.az6
  cidr_block                = var.private3_cidr

  tags = {
      Name                  = "private3"
  }
}

# ------------------Route-table---------------------
resource "aws_route_table" "public_route" {
  vpc_id = var.vpc_id

  route {
    cidr_block = [aws_subnet.public1_sub.cidr_block, aws_subnet.public1_sub.cidr_block, aws_subnet.public1_sub.cidr_block]
  }
  }

