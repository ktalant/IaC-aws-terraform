resource "aws_s3_bucket" "app1_bucket" {
  name                  = var.app1_bucket
  versioning            = var.true_false
}
