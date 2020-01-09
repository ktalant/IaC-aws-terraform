output "vpcid" {
  value = data.aws_vpc.my_vpc.id
}
output "public1cdir" {
  value = aws_subnet.public_sub1.cidr_block
}
output "my_vpc-cidr_block" {
  value = "${data.aws_vpc.my_vpc.cidr_block}"
}
