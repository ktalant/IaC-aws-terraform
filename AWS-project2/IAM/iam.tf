resource "aws_iam_user" "talant" {
  name = "talant"
  path = "/"

tags = {
    Name = "talant"
    Env = "dev"
  }
}

resource "aws_iam_user" "junai" {
  name                  = "junai"
  path                  = "/"
  tags = {
      Name = "junai"
      env = "qa"
  }
}

resource "aws_iam_group" "developers" {
    name                = "developers"
    path                = "/"
}

resource "aws_iam_group_membership" "dev_group" {
  name                  = "dev-group-members"
  users = [
      aws_iam_user.talant.name,
      aws_iam_user.junai.name
  ]
  group = aws_iam_group.developers.name
}


