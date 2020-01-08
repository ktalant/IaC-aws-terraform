resource "aws_vpc" "app1_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "app1-vpc"
  }
}

resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.app1_vpc.id
  cidr_block        = var.az1_cidr
  availability_zone = var.az1

  tags = {
    Name = "app1-vpc-az1"
    az1  = var.az1
  }
}