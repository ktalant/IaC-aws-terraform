provider "aws" {
  region = var.aws_region
  profile = var.aws_profile
}
resource "aws_key_pair" "talant_keypair" {
    key_name = "talant-key"
    public_key = file(var.key_path)
}

data "aws_ami" "talant_ami" {
  most_recent = true
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn-ami-hvm*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "talant_vm" {
    instance_type = var.instance_type
    ami = data.aws_ami.talant_ami.id
    associate_public_ip_address = true

    provisioner "file" {
      source = "script.sh"
      destination = "/tmp/script.sh"
      connection {
        host = self.public_ip
        type          = "ssh"
        user          = "ec2-user"
        private_key   = var.private_key
      }
    }

    provisioner "remote-exec" {
      inline = [
        "chmod +x /tmp/script.sh",
        "/tmp/script.sh args"
      ]
      connection {
        host          = self.public_ip
        type          = "ssh"
        user          = "ec2-user"
        private_key   = var.private_key
      }
    }

    tags = {
      Name = "talant-vm"
    }

    key_name = aws_key_pair.talant_keypair.id
    vpc_security_group_ids = [var.sg_id]
    subnet_id = var.subnet_id
  }
