resource "aws_iam_user" "samara" {
  name = "samara"
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

resource "aws_iam_user" "aibek" {
  name                  = "aibek"
  path                  = "/"
  tags = {
    name  = "aibek"
    env  = "qa"
  }
}


resource "aws_iam_group" "developers" {
    name                = "developers"
    path                = "/"
}

resource "aws_iam_group" "netadmins" {
  name                  = "netadmins"
  path                  = "/"
}

resource "aws_iam_group_membership" "netadmins_group" {
  name                  = "net-admins-group"
  users = [
    aws_iam_user.aibek.name
  ]
  group = aws_iam_group.netadmins.name
}


resource "aws_iam_group_membership" "dev_group" {
  name                  = "dev-group-members"
  users = [
      aws_iam_user.samara.name,
      aws_iam_user.junai.name
  ]
  group = aws_iam_group.developers.name
}
resource "aws_iam_policy" "policy" {
  name        = "test-policy"
  description = "A test policy"

  policy = <<EOF
  {
      "Version": "2012-10-17",
      "Statement": [
          {
              "Action": "ec2:*",
              "Effect": "Allow",
              "Resource": "*"
          },
          {
              "Effect": "Allow",
              "Action": "elasticloadbalancing:*",
              "Resource": "*"
          },
          {
              "Effect": "Allow",
              "Action": "cloudwatch:*",
              "Resource": "*"
          },
          {
              "Effect": "Allow",
              "Action": "autoscaling:*",
              "Resource": "*"
          },
          {
              "Effect": "Allow",
              "Action": "iam:CreateServiceLinkedRole",
              "Resource": "*",
              "Condition": {
                  "StringEquals": {
                      "iam:AWSServiceName": [
                          "autoscaling.amazonaws.com",
                          "ec2scheduled.amazonaws.com",
                          "elasticloadbalancing.amazonaws.com",
                          "spot.amazonaws.com",
                          "spotfleet.amazonaws.com",
                          "transitgateway.amazonaws.com"
                      ]
                  }
              }
          }
      ]
  }
EOF
}
