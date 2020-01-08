resource "aws_key_pair" "new_dev_key" {
    key_name      = "devkey"
    public_key    = file("~/.ssh/id_rsa.pub")

}

resource "aws_instance" "app1_ec2" {
  ami                 = var.ec2_ami
  instance_type       = var.ec2_type
  key_name            = aws_key_pair.new_dev_key.key_name
  availability_zone   = var.az1



  tags = {
    Name = "app1"
    env  = "dev"
  }
}
