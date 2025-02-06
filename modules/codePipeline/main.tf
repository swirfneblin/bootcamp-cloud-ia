resource "aws_codebuild_project" "cloudmart_build" {
  name          = "cloudmartBuild"
  service_role  = var.codebuild_role_arn

  artifacts {
    type = "CODEPIPELINE"
  }
  

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/amazonlinux2-x86_64-standard:4.0"
    type                        = "LINUX_CONTAINER"
    privileged_mode             = true

    environment_variable {
      name  = "ECR_REPO"
      value = var.ecr_repository_url
    }
  }

  source {
    type      = "CODEPIPELINE"
    location  = "https://github.com/${var.github_owner}/cloudmart-frontend.git"
    git_clone_depth = 1
  }
}

resource "aws_codepipeline" "codepipeline" {
  name     = "cloudmart-pipeline"
  role_arn = var.codepipeline_role_arn

  artifact_store {
    location = var.s3_bucket_codepipeline_bucket
    type     = "S3"
  }

  stage {
    name = "Source"

    action {
      name             = "GitHub_Source"
      category         = "Source"
      owner           = "ThirdParty"
      provider        = "GitHub"
      version         = "1"
      output_artifacts = ["source_output"]

      configuration = {
        Owner      = var.github_owner
        Repo       = "cloudsmart-frontend"
        Branch     = "main"
        OAuthToken = var.github_token
      }
    }
  }

  stage {
    name = "Build"

    action {
      name             = "CodeBuild"
      category         = "Build"
      owner           = "AWS"
      provider        = "CodeBuild"
      version         = "1"
      input_artifacts  = ["source_output"]
      output_artifacts = ["build_output"]

      configuration = {
        ProjectName = aws_codebuild_project.cloudmart_build.name
      }
    }
  }
}