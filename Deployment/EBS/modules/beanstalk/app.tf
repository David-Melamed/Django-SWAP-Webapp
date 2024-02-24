resource "aws_elastic_beanstalk_application" "ebslab_app" {
  name        = var.ebs_app_name
  description = var.ebs_app_description
}

resource "aws_elastic_beanstalk_application_version" "default" {
  name        = var.application_version
  application = aws_elastic_beanstalk_application.ebslab_app.name
  description = "Application version created by Terraform"
  bucket      = aws_s3_bucket.dockerrun_bucket.id
  key         = aws_s3_object.dockerrun_object.id
}