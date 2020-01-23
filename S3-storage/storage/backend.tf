terraform {
  backend "s3" {
    bucket = "talant-project1"
    key    = "aws/storage/us-east-1/east1_stage"
    region = "us-east-1"
  }
}
