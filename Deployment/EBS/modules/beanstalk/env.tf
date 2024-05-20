    resource "aws_elastic_beanstalk_environment" "ebslab_env" {
    name = format("%s-%s", var.ebs_app_name, var.env)
    application = aws_elastic_beanstalk_application.ebslab_app.name
    solution_stack_name = var.solution_stack_name
    version_label = "${aws_elastic_beanstalk_application_version.app_version.name}"
    cname_prefix  = var.cname_prefix
    
    setting {
        namespace = "aws:ec2:vpc"
        name      = "VPCId"
        value     = var.vpc_id
    }

    setting {
        namespace = "aws:ec2:vpc"
        name      = "Subnets"
        value     = join(",", var.subnet_ids)
    }

    setting {
      namespace = "aws:elasticbeanstalk:environment"
      name      = "EnvironmentType"
      value     = "LoadBalanced"
    }

    setting {
      namespace = "aws:ec2:instances"
      name = "InstanceTypes"
      value = var.instance_type
    }

    setting {
      namespace = "aws:elasticbeanstalk:environment"
      name      = "ServiceRole"
      value     = var.service_role_arn
    }

    setting {
      namespace = "aws:autoscaling:launchconfiguration"
      name      = "IamInstanceProfile"
      value     = aws_iam_instance_profile.instance_profile.name
    }

    setting {
      namespace = "aws:autoscaling:launchconfiguration"
      name      = "SecurityGroups"
      value     = var.security_group_id[0]
    }

    setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "LoadBalancerType"
    value     = "classic"
    }

    setting {
      namespace = "aws:elb:loadbalancer"
      name      = "ManagedSecurityGroup"
      value     = var.security_group_id[0]
    }

    setting {
      namespace = "aws:elb:loadbalancer"
      name      = "SSLCertificateId"
      value     = var.ssl_certificate_arn
    }
}

resource "aws_iam_instance_profile" "instance_profile" {
  name = "aws-elasticbeanstalk-ec2-instance-profile"
  role = var.service_role_name
}
