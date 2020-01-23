provider "aws" {
  region = var.aws_region
}

# Generate random numbers for buckets
resource "random_id" "bucket_id" {
  byte_length       = 4
}

# Create the bucket
resource "aws_s3_bucket" "my_storage" {
    bucket        = "${var.bucket_name}-${random_id.bucket_id.dec}"
    acl           = "private"

    force_destroy =  true

    tags {
      Name = var.bucket_name
    }
}
