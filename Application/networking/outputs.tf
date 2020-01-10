output "vpcname" {
  value = aws_vpc.wp_vpc
}
output "vpccidrblock" {
  value = aws_vpc.wp_vpc.cidr_block
}


