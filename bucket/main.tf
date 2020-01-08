
provider "aws" {
  region            = "us-east-1"
}

module "app1_vpc_module" {
  source = "./modules"

  bucket_name       = "talant-bucket-2020"
  true_false        = true
}



