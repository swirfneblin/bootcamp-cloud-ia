variable "github_token" {
  description = "Token do GitHub"
  type        = string
}

variable "github_owner" {
  description = "Dono do repositório no GitHub"
  type        = string
}


variable "aws_access_key" {
  description = "AWS Access Key"
  type        = string
}

variable "aws_secret_key" {
  description = "AWS Secret Key"
  type       = string    
}

variable "codepipeline_role_arn" {
  description = "ARN da role do CodePipeline"
  type        = string
  
}

variable "codebuild_role_arn" {
  description = "ARN da role do CodeBuild"
  type        = string
  
}

variable "ecr_repository_url" {
  description = "URL do repositório ECR"
  type        = string
}

variable "s3_bucket_codepipeline_bucket" {
  description = "Nome do bucket do CodePipeline"
  type        = string
  
}