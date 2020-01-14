output "username" {
  value = aws_iam_user.talant.name
}

output "userkey" {
  value = aws_iam_access_key.talant_accesskey
}

output "userpolicy" {
  value = aws_iam_user_policy.talant-ro.policy
}


