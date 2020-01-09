output "vpcid" {
  value = data.aws_vpc.my_vpc.id
}

output "my_vpc-cidr_block" {
  value = "${data.aws_vpc.my_vpc.cidr_block}"
}
output "public1" {
  value = aws_subnet.public_sub1.cidr_block
}

output "public2" {
  value = aws_subnet.public_sub2.cidr_block
}

output "public3" {
  value = aws_subnet.public_sub3.cidr_block
}

output "private1" {
  value = aws_subnet.private_sub1.cidr_block
}

output "private2" {
  value = aws_subnet.private_sub2.cidr_block
}

output "private3" {
  value = aws_subnet.private_sub3.cidr_block
}


output "aws-region" {
  value = var.aws_region
}


