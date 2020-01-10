output "vpcname" {
  value = aws_vpc.wp_vpc.tags.Name
}
output "vpccidrblock" {
  value = aws_vpc.wp_vpc.cidr_block
}

output "region" {
  value = var.aws_region
}

output "azs" {

  value = aws_subnet.wp_public_subnet[0]
  value = aws_subnet.wp_public_subnet[2]
  value = aws_subnet.wp_public_subnet[3]
}


