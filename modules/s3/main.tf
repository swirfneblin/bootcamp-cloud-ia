resource "aws_s3_bucket" "bootcamp_bucket" {
  bucket = "bootcamp-cloud-ia-cdamas"
  # acl    = "private"
}

resource "aws_s3_bucket" "codepipeline_bucket" {
  bucket = "codepipeline-bucket-cdamas"
}