variable "aws_region" {
  description = "Região AWS"
  type        = string
}

variable "instance_type" {
  description = "Tipo de instância"
  type        = string
}

variable "eks_instance_type" {
  description = "Tipo de instância do eks"
  type        = string  
  
}

variable "instance_ami" {
  description = "AMI para instância"
  type        = string
}

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

variable "vite_api_base_url" {
  description = "URL base da API do Vite"
  type        = string
  
}
