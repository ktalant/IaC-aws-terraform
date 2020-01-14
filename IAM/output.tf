output "username" {
  value = aws_iam_user.ulan.name
}

output "userkey" {
  value = aws_iam_access_key.ulan_accesskey
}

output "userpolicy" {
  value = aws_iam_user_policy.ulan_ro.policy
}


