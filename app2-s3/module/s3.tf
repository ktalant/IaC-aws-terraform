resource "random_id" "app2_bucket_id" {
  byte_length               = 4
}

resource "aws_s3_bucket" "app3_storage" {
  bucket                    = "${var.app2_bucket_name}-${random_id.app2_bucket_id.dec}"
  acl                       = "private"
}
