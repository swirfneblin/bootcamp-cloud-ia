
output "s3_bucket_codepipeline_arn" {
  value = aws_s3_bucket.codepipeline_bucket.arn
}


output "s3_bucket_codepipeline_bucket" {
  value = aws_s3_bucket.codepipeline_bucket.bucket
}
