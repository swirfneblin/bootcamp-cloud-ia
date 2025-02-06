resource "aws_ecr_repository" "cloudmart_repo" {
  name = "cloudmart"

  image_scanning_configuration {
    scan_on_push = true
  }

  encryption_configuration {
    encryption_type = "AES256"
  }
}


# Captura a URL do ECR para substituir nos yamls de build e deploy (back e front)
resource "null_resource" "update_buildspec" {
  provisioner "local-exec" {
    command = <<EOT
    sed "s|<ECR_REPOSITORY>|${aws_ecr_repository.cloudmart_repo.repository_url}|" ./buildspecs/template_build.yaml > ./buildspecs/build.yaml

    sed "s|<ECR_REPOSITORY>|${aws_ecr_repository.cloudmart_repo.repository_url}|" ./kubernetes/template-deployment-frontend.yaml > ./kubernetes/deployment-frontend.yaml

    sed "s|<ECR_REPOSITORY>|${aws_ecr_repository.cloudmart_repo.repository_url}|" ./kubernetes/template-deployment-backend.yaml > ./kubernetes/deployment-backend.yaml
    
    EOT
  }

  depends_on = [aws_ecr_repository.cloudmart_repo]
}
