resource "aws_key_pair" "key" {
  key_name   = "ec2-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_security_group" "ec2_sg" {
  name        = "ec2_sg"
  description = "Permite acesso via SSH do IP especificado"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "ec2_instance" {
  ami                    = "ami-0c55b159cbfafe1f0"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.key.key_name
  subnet_id              = data.aws_subnet.default.id
  security_groups        = [aws_security_group.ec2_sg.name]
  associate_public_ip_address = true

  user_data = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install -y git yum-utils
    sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
    sudo yum -y install terraform

    # Clonar repositório com código Terraform
    git clone ${var.git_repo} /home/ec2-user/terraform-repo
    cd /home/ec2-user/terraform-repo

    # Inicializar e aplicar o Terraform
    terraform init
    terraform apply -auto-approve
  EOF
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnet" "default" {
  vpc_id = data.aws_vpc.default.id
}

output "ec2_public_ip" {
  value = aws_instance.ec2_instance.public_ip
}
