provider "aws" {
  region                = "us-east-1"
}

module "storage1" {
  source = "./storage"
}



