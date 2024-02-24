output "ebs_environment_url" {
  value = aws_elastic_beanstalk_environment.ebslab_env.endpoint_url
}

output "ebs_app_name" {
  value = aws_elastic_beanstalk_application.ebslab_app.name
}