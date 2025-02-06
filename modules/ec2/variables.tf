variable "iam_instance_profile" {
  description = "Instance Profile para EC2"
  type        = string
}

variable "sg_name" {
  description = "Security Group Name"
  type        = string
}

variable "instance_type" {
  description = "Tipo de instância"
  type        = string
}

variable "instance_ami" {
  description = "AMI para instância"
  type        = string
}