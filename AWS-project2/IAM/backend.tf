terraform {
    backend "s3" {
        bucket              = "talant-terraform-backend"
        key                 = "aws/iam/iam_state"
        region              = "us-east-1"
    }
}