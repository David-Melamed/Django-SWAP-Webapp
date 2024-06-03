    resource "aws_elastic_beanstalk_environment" "ebslab_env" {
    name = format("%s-%s", var.ebs_app_name, var.env)
    application = aws_elastic_beanstalk_application.ebslab_app.name
    solution_stack_name = var.solution_stack_name
    version_label = "${aws_elastic_beanstalk_application_version.app_version.name}"
    
    setting {
        namespace = "aws:ec2:vpc"
        name      = "VPCId"
        value     = var.vpc_id
    }

    setting {
        namespace = "aws:ec2:vpc"
        name      = "Subnets"
        value     = join(",", var.public_subnet_ids)
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
    value     = "application"
    }

    setting {
      namespace = "aws:elbv2:loadbalancer"
      name      = "SecurityGroups"
      value     = var.security_group_id[0]
    }

    setting {
      namespace = "aws:elbv2:listener:443"
      name      = "ListenerEnabled"
      value     = true
    }

    setting {
      namespace = "aws:elbv2:listener:443"
      name      = "Protocol"
      value     = "HTTPS"
    }
  
    setting {
      namespace = "aws:elbv2:listener:443"
      name      = "SSLCertificateArns"
      value     = var.ssl_certificate_arn
    }

    setting {
      namespace = "aws:elbv2:listener:443"
      name      = "SSLPolicy"
      value     = "ELBSecurityPolicy-2016-08"
    }

    setting {
      namespace = "aws:elasticbeanstalk:application:environment"
      name      = "APP_IMAGE"
      value     = var.app_image
    }

    setting {
      namespace = "aws:elasticbeanstalk:application:environment"
      name      = "TAG"
      value     = var.app_tag
    }

    setting {
      namespace = "aws:elasticbeanstalk:application:environment"
      name      = "DB_HOST"
      value     = var.db_host
    }

    setting {
      namespace = "aws:elasticbeanstalk:application:environment"
      name      = "DB_PORT"
      value     = var.db_port
    }

    setting {
      namespace = "aws:elasticbeanstalk:application:environment"
      name      = "DB_NAME"
      value     = var.db_name
    }

    setting {
      namespace = "aws:elasticbeanstalk:application:environment"
      name      = "DB_USER"
      value     = var.db_user
    }

    setting {
      namespace = "aws:elasticbeanstalk:application:environment"
      name      = "DB_PASSWORD"
      value     = var.db_password
    }

    tags = {
          "environment-name" = format("%s-%s", var.ebs_app_name, var.env)
    }
    
    depends_on = [ 
      var.ssl_certificate_arn
     ]
}

resource "aws_iam_instance_profile" "instance_profile" {
  name = "aws-elasticbeanstalk-ec2-instance-profile"
  role = var.service_role_name
}
