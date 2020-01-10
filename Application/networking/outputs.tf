output "vpcname" {
  value = aws_vpc.wp_vpc.tags.Name
}
output "vpccidrblock" {
  value = aws_vpc.wp_vpc.cidr_block
}

output "region" {
  value = var.aws_region
}

