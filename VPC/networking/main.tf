# Define provider
provider "aws" {
  region = var.aws_region
}

# fetch availability zones
data "aws_availability_zones" "available" {}

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
    Name = "talant-IGW"
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
    Name = "talant-public-RT"
  }
}

# Default route table has been assigned as private route table
resource "aws_default_route_table" "talant_private_rt" {
  default_route_table_id  = aws_vpc.talant_vpc.default_route_table_id

  tags = {
    Name = "talant-private-RT"
  }
}

# Public subnet in 3 available
resource "aws_subnet" "talant_public_subnet" {
  count                   = var.subnet_count
  vpc_id                  = aws_vpc.talant_vpc.id
  cidr_block              = var.public_cidrs[count.index]
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name = "talant-public-subnet_${count.index + 1}"
  }
}

# Public subnet association to public route table
resource "aws_route_table_association" "talant_public_assoc" {
  count          = length(aws_subnet.talant_public_subnet)
  subnet_id      = aws_subnet.talant_public_subnet.*.id[count.index]
  route_table_id = aws_route_table.talant_public_rt.id
}

# Private  subnet in 3 available
resource "aws_subnet" "talant_private_subnet" {
  count                   = 3
  vpc_id                  = aws_vpc.talant_vpc.id
  cidr_block              = var.private_cidrs[count.index]
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name = "talant-private-subnet_${count.index + 1}"
  }
}

# Private subnet association to private route table
resource "aws_route_table_association" "talant_private_assoc" {
  count          = length(aws_subnet.talant_private_subnet)
  subnet_id      = aws_subnet.talant_private_subnet.*.id[count.index]
  route_table_id = aws_default_route_table.talant_private_rt.id
}
