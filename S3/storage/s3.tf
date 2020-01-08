provider "aws" {
  region                    = var.aws_region
}

resource "random_id" "storage_id" {
  byte_length               = 4
}
resource "aws_s3_bucket" "storage1" {
  bucket                    = "${var.storage_name}-${random_id.storage_id.dec}"
  acl                       = "private"
  force_destroy             = true

  tags = {
      Name = var.storage_name
  }
}


