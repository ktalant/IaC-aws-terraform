resource "aws_iam_user" "ulan" {
  name = "ulan"
  path = "/"

  tags = {
    Name = "sys-user"
  }
}

resource "aws_iam_access_key" "ulan_accesskey" {
  user = aws_iam_user.ulan.name
}

resource "aws_iam_user_policy" "ulan_ro" {
  name = "test"
  user = aws_iam_user.ulan.name

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:Describe*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}