resource "aws_elastic_beanstalk_application" "ebslab_app" {
  name        = var.ebs_app_name
  description = var.ebs_app_description
}

resource "aws_elastic_beanstalk_environment" "ebslab_env" {
  name                = var.env
  application         = aws_elastic_beanstalk_application.ebslab_app.name
  solution_stack_name = "64bit Amazon Linux 2023 v4.2.1 running Docker"
}