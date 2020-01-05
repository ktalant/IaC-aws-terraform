terraform {
    backend "s3" {
        bucket              = "talant-terraform-backend"
        key                 = "env"
        region              = "us-east-1"
    }
}