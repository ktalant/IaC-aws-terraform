resource "aws_s3_bucket" "bucket1_module" {
  bucket              = var.bucket_name
  versioning          = var.true_false
}
