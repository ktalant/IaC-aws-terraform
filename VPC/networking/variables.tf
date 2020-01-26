variable "vpc_cidr" {}
variable "vpc_tag" {}
variable "aws_region" {}
variable "igw_tag" {}
variable "public_rt_tag" {}
variable "private_rt_tag" {}
variable "public_cidrs" {
  type = list
}
variable "public_subnet_tag" {}
