output "iam_instance_profile" {
  value = aws_iam_instance_profile.ec2_profile.name
}

output "codepipeline_role_arn" {
  value = aws_iam_role.codepipeline_role.arn
}

output "codebuild_role_arn" {
  value = aws_iam_role.codebuild_role.arn
}

output "deploy_role_arn" {
  value = aws_iam_role.codebuild_deploy_role.arn
}