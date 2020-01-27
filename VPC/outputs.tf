output "paris-public-subnets" {
  value = module.vpc-paris.public-subnets
}

output "paris-private-subnets" {
  value = module.vpc-paris.private-subnets
}

output "paris-SG-id" {
  value = module.vpc-paris.security-group
}
