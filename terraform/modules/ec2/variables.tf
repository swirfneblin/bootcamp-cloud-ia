variable "my_ip" {
  description = "IP público para acesso SSH"
  type        = string
  default = "0.0.0.0"
}

variable "iam_instance_profile" {
  description = "Instance Profile para EC2"
  type        = string
}
