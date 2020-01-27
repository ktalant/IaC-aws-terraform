output "public-subnets" {
  value = aws_subnet.talant_public_subnet.*.id
}

output "private-subnets" {
  value = aws_subnet.talant_private_subnet.*.id
}

output "security-group" {
  value = aws_security_group.talant_sg_new.name 
}
