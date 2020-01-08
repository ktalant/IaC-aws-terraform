
module "app1_vpc_module" {
  source = "./vpc"

  vpc_cidr              = "172.16.0.0/16"
  az1_cidr              = "172.16.0.0/24"
  az1                   = "us-east-2"
}



