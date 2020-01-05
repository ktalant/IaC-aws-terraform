terraform {
    backend "s3" {
        bucket              = "talant-terraform-backend"
        key                 = "aws/iam/infrastructure"
        region              = "us-east-1"
    }
}