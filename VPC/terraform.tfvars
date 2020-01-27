# ----- speficy region here
aws_region = "eu-west-3"
subnet_count = 1

#-----specify cidr block for VPC  and tag VPC here
vpc_cidr = "192.168.0.0/16"
vpc_tag = "west-VPC"


#-----speficy public and private subnet cidrs here
public_cidrs = ["192.168.1.0/24"]
private_cidrs = ["192.168.11.0/24"]


#-----specify cidr_block for security group ssh and http here
accessip = ["0.0.0.0/0"]
