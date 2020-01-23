output "bucketname" {
  value = aws_s3_bucket.talant_bucket.*.id
}
