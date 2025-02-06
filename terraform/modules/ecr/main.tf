resource "aws_ecr_repository" "cloudmart_repo" {
  name = "cloudmart"

  image_scanning_configuration {
    scan_on_push = true
  }

  encryption_configuration {
    encryption_type = "AES256"
  }
}
