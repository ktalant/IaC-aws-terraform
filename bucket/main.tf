
provider "aws" {
  region            = "us-east-1"
}

module "bucket1" {
  source = "./modules"

  bucket_name       = "azhar-jasmine-meeriem-samara-2020"
}



