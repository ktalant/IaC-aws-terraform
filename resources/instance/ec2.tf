resource "aws_key_pair" "new_dev_key" {
    key_name      = "devkey"
    public_key    = "~/.ssh/id_rsa.pub"

}

resource "aws_instance" "app1_ec2" {
  ami           = var.ec2_ami
  instance_type = var.ec2_type
  key_name      = aws_key_pair.dev_key.key_name


  tags = {
    Name = "app1"
    env  = "dev"
  }
}
