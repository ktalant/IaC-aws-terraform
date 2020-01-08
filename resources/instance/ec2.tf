resource "aws_key_pair" "dev_key" {
    key_name      = var.ec2_keyname
    public_key    = "~/.ssh/id_rsa.pub"

    key_name      = aws_key_pair.dev_key.key_name
}

resource "aws_instance" "app1_ec2" {
  ami           = var.ec2_ami
  instance_type = var.ec2_type

  tags = {
    Name = "app1"
    env  = "dev"
  }
}
