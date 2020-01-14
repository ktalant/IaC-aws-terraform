terraform {
    backend "s3" {
        bucket      = "backend-state-talant"
        key         = "aws/vpc/vpc_state"
        region      = "us-east-1"
    }
}