output "bucketname" {
  value = aws_s3_bucket.my_storage.*.id
}
