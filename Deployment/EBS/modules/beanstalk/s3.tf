resource "aws_s3_bucket" "dockerrun_bucket" {
  bucket = var.bucket_name
}

resource "aws_s3_object" "dockerrun_object" {
  bucket = aws_s3_bucket.dockerrun_bucket.id
  key    = "beanstalk/docker-compose.yml"
  source = "docker-compose.yml"
}
