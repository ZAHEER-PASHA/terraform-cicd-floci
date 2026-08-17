output "bucket_name" {
  value = aws_s3_bucket.cicd.bucket
}

output "bucket_arn" {
  value = aws_s3_bucket.cicd.arn
}