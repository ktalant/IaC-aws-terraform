provider "aws" {
  region = var.aws_region
  profile = var.aws_profile
}
resource "aws_key_pair" "talant_keypair" {
    key_name = "talant-key"
    public_key = file(var.key_path)
}
# resource "aws_instance" "talant_vm" {
#     instance_type = var.instance_type
#     ami = var.ami_id
#
#     tags = {
#       Name = "talant-vm"
#     }
#     key_name = aws_key_pair.talant_keypair.id
#     vpc_security_group_ids = [module.networking.aws_security_group.talant_sg_new.id]
#     subnet_id = module.networking.aws_subnet.wp_public_subnet1.id
#   }
