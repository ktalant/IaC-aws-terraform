provider "aws" {
  type = "list"
  count = "${length(var.aws_region)}"
  region = "${element(var.aws_region, count.index)}"
}

variable "aws_region" {
  type    = "list"
}

# Generate random numbers for buckets
resource "random_id" "bucket_id" {
  byte_length       = 4
}

# Create the bucket

variable "s3_bucket_name" {
  type    = "list"
}

resource "aws_s3_bucket" "talant_bucket" {
  count         = "${length(var.bucket_name)}"
  bucket        = "${element(var.bucket_name, count.index)}-${random_id.bucket_id.dec}"
  acl           = "private"
  force_destroy = "true"

  tags = {
    Name = "${element(var.s3_bucket_name, count.index)}"
  }
}
