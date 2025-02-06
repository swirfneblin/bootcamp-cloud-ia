provider "aws" {
  region = var.aws_region
}

module "iam" {
  source = "./modules/iam"
}

module "sg" {
  source = "./modules/sg"
}

module "ec2" {
  source               = "./modules/ec2"
  iam_instance_profile = module.iam.iam_instance_profile
  sg_name = module.sg.sg_name
}

module "s3" {
  source = "./modules/s3"
}

module "dynamoDb" {
  source = "./modules/dynamoDb"
}

module "eks" {
  source = "./modules/eks"
}

module "ecr" {
  source = "./modules/ecr"
}