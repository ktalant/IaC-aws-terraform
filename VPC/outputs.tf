output "talant-public-subnets" {
  value = module.vpc-talant.public-subnets
}

output "talant-private-subnets" {
  value = module.vpc-talant.private-subnets
}

output "talant-SG-id" {
  value = module.vpc-talant.security-group
}
