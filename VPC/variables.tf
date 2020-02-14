variable "vpc_cidr" {}
variable "vpc_tag" {}
variable "aws_region" {}
variable "public_cidrs" {
  type = list
}
variable "private_cidrs" {
  type = list
}
variable "accessip" {
  type = list
}
variable "subnet_count" {}
variable "aws_profile" {}
