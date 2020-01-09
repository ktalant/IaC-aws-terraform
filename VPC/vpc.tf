data "aws_vpc" "my_vpc" {
  id = var.vpc_id
}

resource "aws_subnet" "public_sub1" {
  vpc_id            = data.aws_vpc.selected.id
  availability_zone = var.az1
  cidr_block        = cidrsubnet(data.aws_vpc.my_vpc.cidr_block, 4, 1)
}

