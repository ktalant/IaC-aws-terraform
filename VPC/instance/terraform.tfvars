aws_region    = "us-east-1"
aws_profile   = "jasmine"

key_path      = "/root/.ssh/id_rsa.pub"
subnet_id     = "subnet-0600c68f57af6b37c"
sg_id         = "sg-04fe8f53ea1ecb341"
instance_type = "t2.medium"
private_key   = file("root/.ssh/id_rsa")
