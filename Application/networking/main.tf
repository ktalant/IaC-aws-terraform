data "aws_availability_zones" "availability" {}

resource "aws_vpc" "wp_vpc" {
  enable_dns_hostnames      = true
  enable_dns_support        = true
  cidr_block                = var.wp_vpc_cidr

  tags  = {
      Name                  = "wp-vpc"
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
    cidr_blocks = var.accessip
  }

  # HTTP
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.accessip
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}