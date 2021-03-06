resource "aws_security_group" "talant_sg_new" {
  name        = "talant-SG-new"
  description = "Used for ssh and http"
  vpc_id      = aws_vpc.talant_vpc.id

  tags = {
    Name = "talant-SG-ssh-http"
  }
  #SSH
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.accessip
  }

  #HTTP
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.accessip
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
