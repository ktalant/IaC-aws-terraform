provider "aws" {
  region                = var.aws_region
}


resource "aws_vpc" "wp_vpc" {
  enable_dns_hostnames      = true
  enable_dns_support        = true
  cidr_block                = var.wp_vpc_cidr

  tags  = {
      Name                  = "wp-vpc"
  }
}

resource "aws_internet_gateway" "wp_igw" {
  vpc_id                    = aws_vpc.wp_vpc.id

  tags = {
      Name  = "wp-IGW"
  }
}

resource "aws_route_table" "wp_public_rt" {
  vpc_id                    = aws_vpc.wp_vpc.id

  route {
      cidr_block            = "0.0.0.0/0"
      gateway_id            = aws_internet_gateway.wp_igw.id
  }
  tags = {
      Name = "wp-public-RT"
  }
}

resource "aws_default_route_table" "wp_private_rt" {
  default_route_table_id    = aws_vpc.wp_vpc.default_route_table_id

  tags = {
      Name = "wp-private-RT"
  }
}





resource "aws_security_group" "ssh-sg" {
  name        = "allow_ssh"
  description = "Allow port 22"
  vpc_id      = aws_vpc.wp_vpc.id

  # SSH
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.accessip]
  }

  # HTTP
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.accessip]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}