resource "aws_s3_bucket" "dockerrun_bucket" {
  bucket = var.bucket_name
  object_lock_enabled = false
}

resource "aws_s3_object" "dockerrun_object" {
  bucket = aws_s3_bucket.dockerrun_bucket.id
  key = "beanstalk/docker-compose-${var.application_version}.yml"
  source = "docker-compose.yml"
}