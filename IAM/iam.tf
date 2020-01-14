resource "aws_iam_user" "talant" {
  name = "talant"
  path = "/"

  tags = {
    Name = "talant-user"
  }
}

resource "aws_iam_access_key" "talant_accesskey" {
  user = "${aws_iam_user.talant.name}"
}

resource "aws_iam_user_policy" "talant_ro" {
  name = "talant-ec-2ro"
  user = "${aws_iam_user.talant.name}"

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