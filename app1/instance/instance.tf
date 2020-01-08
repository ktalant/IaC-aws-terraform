resource "aws_ec2_instance" "app1_instance" {
  ami                   = var.ec2_ami
  instance_type         = var.ec2_type
}
