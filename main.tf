provider "aws" {
  region = var.aws_region
}


module "iam" {
  source = "./modules/iam"
  s3_bucket_codepipeline_arn = module.s3.s3_bucket_codepipeline_arn
}

module "sg" {
  source = "./modules/sg"
}

module "ec2" {
  source               = "./modules/ec2"
  iam_instance_profile = module.iam.iam_instance_profile
  sg_name = module.sg.sg_name
  instance_ami = var.instance_ami
  instance_type = var.instance_type
}

module "s3" {
  source = "./modules/s3"
}

module "dynamoDb" {
  source = "./modules/dynamoDb"
}

module "eks" {
  source = "./modules/eks"
  eks_instance_type = var.eks_instance_type
}

module "ecr" {
  source = "./modules/ecr"
}

module "codePipeline" {
  source = "./modules/codePipeline"
  github_owner = var.github_owner
  github_token = var.github_token
  aws_access_key = var.aws_access_key
  aws_secret_key = var.aws_secret_key
  codepipeline_role_arn = module.iam.codepipeline_role_arn
  codebuild_role_arn = module.iam.codebuild_role_arn
  deploy_role_arn = module.iam.deploy_role_arn
  ecr_repository_url   = module.ecr.ecr_repository_url
  s3_bucket_codepipeline_bucket = module.s3.s3_bucket_codepipeline_bucket
}