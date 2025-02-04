variable "aws_region" {
  description = "Região AWS"
  type        = string
  default     = "us-east-1"
}

variable "my_ip" {
  description = "IP público para acessar a instância EC2"
  type        = string
}

variable "git_repo" {
  description = "Repositório contendo os recursos Terraform"
  type        = string
}

variable "branch" {
  description = "Branch do repositório Git"
  type        = string
  default     = "develop"
}