terraform {
  backend "s3" {
    bucket = "talant-project1"
    key    = "aws/networking/vpc_state"
    region = "us-east-1"
  }
}
