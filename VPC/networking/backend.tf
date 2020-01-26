terraform {
  backend "s3" {
    bucket = "talant-project-122"
    key    = "aws/networking/vpc_state"
    region = "us-east-1"
  }
}
