output "ebs_environment_url" {
  value = aws_elastic_beanstalk_environment.ebslab_env.endpoint_url
}

output "ebs_app_name" {
  value = aws_elastic_beanstalk_application.ebslab_app.name
}

output "instance_private_ips" {
  value = aws_elastic_beanstalk_environment.ebslab_env.instances
  sensitive = true
}

output "env" {
  value = aws_elastic_beanstalk_environment.ebslab_env.name
}