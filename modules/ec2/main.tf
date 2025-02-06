resource "aws_instance" "ec2_instance" {
  ami                         = var.instance_ami 
  instance_type               = var.instance_type
  iam_instance_profile        = var.iam_instance_profile
  security_groups             = [var.sg_name]
  associate_public_ip_address = true

  user_data = <<-EOF
    #!/bin/bash

    sudo yum update -y
    sudo yum install docker -y
    sudo systemctl start docker
    sudo docker run hello-world
    sudo systemctl enable docker
    docker --version
    sudo usermod -a -G docker $(whoami)
    newgrp docker

    mkdir -p challenge-day2/backend && cd challenge-day2/backend
    wget https://tcb-public-events.s3.amazonaws.com/mdac/resources/day2/cloudmart-backend.zip
    unzip cloudmart-backend.zip

    cat <<EOT > .env
    PORT=5000
    AWS_REGION=us-east-1
    BEDROCK_AGENT_ID=<seu-bedrock-agent-id>
    BEDROCK_AGENT_ALIAS_ID=<seu-bedrock-agent-alias-id>
    OPENAI_API_KEY=<sua-chave-api-openai>
    OPENAI_ASSISTANT_ID=<seu-id-assistente-openai>
    EOT

    chown ec2-user:ec2-user .env

    cat <<EOT > Dockerfile
    FROM node:18
    WORKDIR /usr/src/app
    COPY package*.json ./
    RUN npm install
    COPY . .
    EXPOSE 5000
    CMD ["npm", "start"]
    EOT

    docker build -t cloudmart-backend .
    docker run -d -p 5000:5000 --env-file .env cloudmart-backend

    cd ..
    mkdir frontend && cd frontend
    wget https://tcb-public-events.s3.amazonaws.com/mdac/resources/day2/cloudmart-frontend.zip
    unzip cloudmart-frontend.zip

    echo "VITE_API_BASE_URL=http://$(curl -s ifconfig.me):5000/api" >> .env 
    
    cat <<EOT > Dockerfile
    FROM node:16-alpine as build
    WORKDIR /app
    COPY package*.json ./
    RUN npm ci
    COPY . .
    RUN npm run build

    FROM node:16-alpine
    WORKDIR /app
    RUN npm install -g serve
    COPY --from=build /app/dist /app
    ENV PORT=5001
    ENV NODE_ENV=production
    EXPOSE 5001
    CMD ["serve", "-s", ".", "-l", "5001"]
    EOT

    docker build -t cloudmart-frontend .
    docker run -d -p 5001:5001 cloudmart-frontend

  EOF
}
