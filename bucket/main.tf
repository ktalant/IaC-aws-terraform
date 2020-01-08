
provider "aws" {
  region            = "us-east-1"
}

module "bucket1" {
  source = "./modules"

  bucket_name       = "talant-bucket-2020"
  true_false        = true
}



