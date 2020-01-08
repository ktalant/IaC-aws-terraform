
module "app1_instance" {
  source = "./instance"

  ec2_ami           = "ami-00068cd7555f543d5"
  ec2_type          = "t2.medium"
  app1_vpc_id       = "vpc-0c1fb90bbb0e2985c"
}



