output "ec2_public_ips" {
    value = module.beanstalk.ec2_public_ips
}

output "beanstalk_env_name" {
    value = module.beanstalk.environment_name
}