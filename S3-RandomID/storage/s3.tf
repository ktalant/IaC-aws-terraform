resource "random_id" "bucket_id" {
  byte_length           = 4
}

resource "aws_s3_bucket" "app1_bucket" {
  bucket                    = "${var.project_name1}-${random_id.bucket_id.dec}"
  acl                       = "private"
  force_destroy             = true

  tags = {
      Name  = "app1-bucket"
  }
}

resource "aws_s3_bucket" "app2_bucket" {
  bucket                    = "${var.project_name2}-${random_id.bucket_id.dec}"
  acl                       = "private"
  force_destroy             = true

  tags = {
      Name  = "app1-bucket"
  }
}
