resource "random_id" "devid" {
  byte_length               = 2
}

resource "aws_s3_bucket" "dev_bucket1" {
  bucket                    = "${var.devbucket}-${random_id.devid.dec}"
  acl                       = "private"

  tags = {
      Name                  = "devbucket"
      env                   = "dev"
  }
}
