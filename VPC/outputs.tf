output "vpcid" {
  value = data.aws_vpc.my_vpc.id
}

output "my_vpc-cidr_block" {
  value = "${data.aws_vpc.my_vpc.cidr_block}"
}
output "public1" {
  value = aws_subnet.public_sub1.cidr_block
}

