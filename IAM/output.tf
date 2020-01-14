output "username" {
  value = aws_iam_user.talant.name
}

output "userkey" {
  value = aws_iam_access_key.talant_accesskey
}

