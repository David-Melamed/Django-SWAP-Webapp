resource "aws_s3_bucket" "dockerrun_bucket" {
  bucket = var.bucket_name
}

resource "aws_s3_object" "dockerrun_object" {
  bucket = aws_s3_bucket.dockerrun_bucket.id
  key    = "beanstalk/Dockerrun.aws.json"
  source = "Dockerrun.aws.json"
}