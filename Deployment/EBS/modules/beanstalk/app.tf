resource "aws_elastic_beanstalk_application" "ebslab_app" {
  name        = var.ebs_app_name
  description = var.ebs_app_description
}