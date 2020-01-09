variable "vpc_id" {}

data "aws_vpc" "selected" {
  id = "${var.vpc_id}"
}

output "vpcid" {
  value = data.aws_vpc.selected.id
}
