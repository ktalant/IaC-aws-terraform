resource "aws_iam_user" "talant" {
  name = "talant"
  path = "/"

tags = {
    Name = "talant"
    Env = "dev"
  }
}
