output "devbucket" {
  value = aws_s3_bucket.dev_bucket1.id
}
output "devbucketarn" {
  value = aws_s3_bucket.dev_bucket1.arn
}

