resource "aws_instance" "ec2_instance" {
  ami                         = "ami-0c614dee691cbbf37"  
  instance_type               = "t2.micro"
  iam_instance_profile        = var.iam_instance_profile
  associate_public_ip_address = true

  user_data = <<-EOF
    #!/bin/bash
    # sudo yum update -y
    # sudo yum install -y yum-utils
    # sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
    # sudo yum -y install terraform git
  EOF
}
