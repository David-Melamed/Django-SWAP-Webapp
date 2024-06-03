{
  "version": 4,
  "terraform_version": "1.2.9",
  "serial": 2336,
  "lineage": "bc161195-7774-1177-82ad-f56001af2e91",
  "outputs": {},
  "resources": [
    {
      "mode": "managed",
      "type": "random_string",
      "name": "suffix",
      "provider": "provider[\"registry.terraform.io/hashicorp/random\"]",
      "instances": [
        {
          "schema_version": 1,
          "attributes": {
            "id": "otIB",
            "keepers": null,
            "length": 4,
            "lower": true,
            "min_lower": 0,
            "min_numeric": 0,
            "min_special": 0,
            "min_upper": 0,
            "number": true,
            "override_special": null,
            "result": "otIB",
            "special": false,
            "upper": true
          },
          "sensitive_attributes": [],
          "private": "eyJzY2hlbWFfdmVyc2lvbiI6IjEifQ=="
        }
      ]
    },
    {
      "module": "module.acm",
      "mode": "managed",
      "type": "aws_acm_certificate",
      "name": "web_cert",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "arn": "arn:aws:acm:eu-west-1:884878220922:certificate/a68268a2-ca34-440c-bd1b-032efddaf37b",
            "certificate_authority_arn": "",
            "certificate_body": null,
            "certificate_chain": null,
            "domain_name": "swapapp.net",
            "domain_validation_options": [
              {
                "domain_name": "swapapp.net",
                "resource_record_name": "_0305b827ea25a4f9e8b611f33a3ab072.swapapp.net.",
                "resource_record_type": "CNAME",
                "resource_record_value": "_10bbebb8018a68ce4e2d6340409b2b45.sdgjtdhdhz.acm-validations.aws."
              }
            ],
            "id": "arn:aws:acm:eu-west-1:884878220922:certificate/a68268a2-ca34-440c-bd1b-032efddaf37b",
            "options": [
              {
                "certificate_transparency_logging_preference": "ENABLED"
              }
            ],
            "private_key": null,
            "status": "PENDING_VALIDATION",
            "subject_alternative_names": [
              "swapapp.net"
            ],
            "tags": {
              "Name": "EBS Lab ACM Certificate"
            },
            "tags_all": {
              "Name": "EBS Lab ACM Certificate"
            },
            "validation_emails": [],
            "validation_method": "DNS",
            "validation_option": []
          },
          "sensitive_attributes": [],
          "private": "bnVsbA==",
          "create_before_destroy": true
        }
      ]
    },
    {
      "module": "module.acm",
      "mode": "managed",
      "type": "aws_acm_certificate_validation",
      "name": "cert_validation",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "certificate_arn": "arn:aws:acm:eu-west-1:884878220922:certificate/a68268a2-ca34-440c-bd1b-032efddaf37b",
            "id": "0001-01-01 00:00:00 +0000 UTC",
            "timeouts": null,
            "validation_record_fqdns": [
              "_0305b827ea25a4f9e8b611f33a3ab072.swapapp.net"
            ]
          },
          "sensitive_attributes": [],
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjo0NTAwMDAwMDAwMDAwfX0=",
          "dependencies": [
            "module.acm.aws_acm_certificate.web_cert",
            "module.acm.aws_route53_record.cert_validation",
            "module.route53_zone.aws_route53_zone.ebs-lab"
          ]
        }
      ]
    },
    {
      "module": "module.acm",
      "mode": "managed",
      "type": "aws_route53_record",
      "name": "cert_validation",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "index_key": "swapapp.net",
          "schema_version": 2,
          "attributes": {
            "alias": [],
            "allow_overwrite": null,
            "failover_routing_policy": [],
            "fqdn": "_0305b827ea25a4f9e8b611f33a3ab072.swapapp.net",
            "geolocation_routing_policy": [],
            "health_check_id": null,
            "id": "Z06784731O4L20UC9OP71__0305b827ea25a4f9e8b611f33a3ab072.swapapp.net._CNAME",
            "latency_routing_policy": [],
            "multivalue_answer_routing_policy": null,
            "name": "_0305b827ea25a4f9e8b611f33a3ab072.swapapp.net",
            "records": [
              "_10bbebb8018a68ce4e2d6340409b2b45.sdgjtdhdhz.acm-validations.aws."
            ],
            "set_identifier": null,
            "ttl": 60,
            "type": "CNAME",
            "weighted_routing_policy": [],
            "zone_id": "Z06784731O4L20UC9OP71"
          },
          "sensitive_attributes": [],
          "private": "eyJzY2hlbWFfdmVyc2lvbiI6IjIifQ==",
          "dependencies": [
            "module.acm.aws_acm_certificate.web_cert",
            "module.route53_zone.aws_route53_zone.ebs-lab"
          ]
        }
      ]
    },
    {
      "module": "module.beanstalk",
      "mode": "data",
      "type": "aws_lb",
      "name": "front_end",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "access_logs": [
              {
                "bucket": "",
                "enabled": false,
                "prefix": ""
              }
            ],
            "arn": "arn:aws:elasticloadbalancing:eu-west-1:884878220922:loadbalancer/app/awseb--AWSEB-Apdi6G8imhfQ/7871b3379c770be1",
            "arn_suffix": "app/awseb--AWSEB-Apdi6G8imhfQ/7871b3379c770be1",
            "customer_owned_ipv4_pool": "",
            "desync_mitigation_mode": "defensive",
            "dns_name": "awseb--AWSEB-Apdi6G8imhfQ-709082568.eu-west-1.elb.amazonaws.com",
            "drop_invalid_header_fields": false,
            "enable_deletion_protection": false,
            "enable_http2": true,
            "enable_waf_fail_open": false,
            "id": "arn:aws:elasticloadbalancing:eu-west-1:884878220922:loadbalancer/app/awseb--AWSEB-Apdi6G8imhfQ/7871b3379c770be1",
            "idle_timeout": 60,
            "internal": false,
            "ip_address_type": "ipv4",
            "load_balancer_type": "application",
            "name": "awseb--AWSEB-Apdi6G8imhfQ",
            "security_groups": [
              "sg-0c087152bef9b6cbd",
              "sg-0ddd62ea024777416"
            ],
            "subnet_mapping": [
              {
                "allocation_id": "",
                "ipv6_address": "",
                "outpost_id": "",
                "private_ipv4_address": "",
                "subnet_id": "subnet-0055821a14ba6426e"
              },
              {
                "allocation_id": "",
                "ipv6_address": "",
                "outpost_id": "",
                "private_ipv4_address": "",
                "subnet_id": "subnet-01ec084b93589b74c"
              }
            ],
            "subnets": [
              "subnet-0055821a14ba6426e",
              "subnet-01ec084b93589b74c"
            ],
            "tags": {
              "Name": "swapapp-dev-dev",
              "elasticbeanstalk:environment-id": "e-8jh55e2tug",
              "elasticbeanstalk:environment-name": "swapapp-dev-dev",
              "environment-name": "swapapp-dev-dev"
            },
            "vpc_id": "vpc-035ed49b3d80ac227",
            "zone_id": "Z32O12XQLNTSW2"
          },
          "sensitive_attributes": []
        }
      ]
    },
    {
      "module": "module.beanstalk",
      "mode": "managed",
      "type": "aws_elastic_beanstalk_application",
      "name": "ebslab_app",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "appversion_lifecycle": [],
            "arn": "arn:aws:elasticbeanstalk:eu-west-1:884878220922:application/swapapp-dev",
            "description": "Python Web App Application using Django Framework",
            "id": "swapapp-dev",
            "name": "swapapp-dev",
            "tags": {
              "environment-name": "swapapp-dev-dev"
            },
            "tags_all": {
              "environment-name": "swapapp-dev-dev"
            }
          },
          "sensitive_attributes": [],
          "private": "bnVsbA=="
        }
      ]
    },
    {
      "module": "module.beanstalk",
      "mode": "managed",
      "type": "aws_elastic_beanstalk_application_version",
      "name": "app_version",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "application": "swapapp-dev",
            "arn": "arn:aws:elasticbeanstalk:eu-west-1:884878220922:applicationversion/swapapp-dev/swapapp-dev-dev-1.943",
            "bucket": "swapapp-dev-bucket",
            "description": "",
            "force_delete": false,
            "id": "swapapp-dev-dev-1.943",
            "key": "beanstalk/swapapp-1.943.zip",
            "name": "swapapp-dev-dev-1.943",
            "tags": null,
            "tags_all": {}
          },
          "sensitive_attributes": [],
          "private": "bnVsbA==",
          "dependencies": [
            "module.beanstalk.aws_elastic_beanstalk_application.ebslab_app",
            "module.beanstalk.aws_s3_bucket.dockerrun_bucket",
            "module.beanstalk.aws_s3_object.application_zip"
          ]
        }
      ]
    },
    {
      "module": "module.beanstalk",
      "mode": "managed",
      "type": "aws_elastic_beanstalk_environment",
      "name": "ebslab_env",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 1,
          "attributes": {
            "all_settings": [
              {
                "name": "AccessLogsS3Bucket",
                "namespace": "aws:elbv2:loadbalancer",
                "resource": "",
                "value": ""
              },
              {
                "name": "AccessLogsS3Enabled",
                "namespace": "aws:elbv2:loadbalancer",
                "resource": "",
                "value": "false"
              },
              {
                "name": "AccessLogsS3Prefix",
                "namespace": "aws:elbv2:loadbalancer",
                "resource": "",
                "value": ""
              },
              {
                "name": "AppSource",
                "namespace": "aws:cloudformation:template:parameter",
                "resource": "",
                "value": "https://elasticbeanstalk-platform-assets-eu-west-1.s3.eu-west-1.amazonaws.com/stalks/eb_docker_amazon_linux_2023_1.0.611.0_20240513193348/sampleapp/EBSampleApp-Docker.zip"
              },
              {
                "name": "Application Healthcheck URL",
                "namespace": "aws:elasticbeanstalk:application",
                "resource": "",
                "value": ""
              },
              {
                "name": "AssociatePublicIpAddress",
                "namespace": "aws:ec2:vpc",
                "resource": "",
                "value": "false"
              },
              {
                "name": "Automatically Terminate Unhealthy Instances",
                "namespace": "aws:elasticbeanstalk:monitoring",
                "resource": "",
                "value": "true"
              },
              {
                "name": "Availability Zones",
                "namespace": "aws:autoscaling:asg",
                "resource": "",
                "value": "Any"
              },
              {
                "name": "BatchSize",
                "namespace": "aws:elasticbeanstalk:command",
                "resource": "",
                "value": "100"
              },
              {
                "name": "BatchSizeType",
                "namespace": "aws:elasticbeanstalk:command",
                "resource": "",
                "value": "Percentage"
              },
              {
                "name": "BlockDeviceMappings",
                "namespace": "aws:autoscaling:launchconfiguration",
                "resource": "",
                "value": ""
              },
              {
                "name": "BreachDuration",
                "namespace": "aws:autoscaling:trigger",
                "resource": "",
                "value": "5"
              },
              {
                "name": "ConfigDocument",
                "namespace": "aws:elasticbeanstalk:healthreporting:system",
                "resource": "",
                "value": "{\"Version\":1,\"CloudWatchMetrics\":{\"Instance\":{\"CPUIrq\":null,\"LoadAverage5min\":null,\"ApplicationRequests5xx\":null,\"ApplicationRequests4xx\":null,\"CPUUser\":null,\"LoadAverage1min\":null,\"ApplicationLatencyP50\":null,\"CPUIdle\":null,\"InstanceHealth\":null,\"ApplicationLatencyP95\":null,\"ApplicationLatencyP85\":null,\"RootFilesystemUtil\":null,\"ApplicationLatencyP90\":null,\"CPUSystem\":null,\"ApplicationLatencyP75\":null,\"CPUSoftirq\":null,\"ApplicationLatencyP10\":null,\"ApplicationLatencyP99\":null,\"ApplicationRequestsTotal\":null,\"ApplicationLatencyP99.9\":null,\"ApplicationRequests3xx\":null,\"ApplicationRequests2xx\":null,\"CPUIowait\":null,\"CPUNice\":null},\"Environment\":{\"InstancesSevere\":null,\"InstancesDegraded\":null,\"ApplicationRequests5xx\":null,\"ApplicationRequests4xx\":null,\"ApplicationLatencyP50\":null,\"ApplicationLatencyP95\":null,\"ApplicationLatencyP85\":null,\"InstancesUnknown\":null,\"ApplicationLatencyP90\":null,\"InstancesInfo\":null,\"InstancesPending\":null,\"ApplicationLatencyP75\":null,\"ApplicationLatencyP10\":null,\"ApplicationLatencyP99\":null,\"ApplicationRequestsTotal\":null,\"InstancesNoData\":null,\"ApplicationLatencyP99.9\":null,\"ApplicationRequests3xx\":null,\"ApplicationRequests2xx\":null,\"InstancesOk\":null,\"InstancesWarning\":null}}}"
              },
              {
                "name": "Cooldown",
                "namespace": "aws:autoscaling:asg",
                "resource": "",
                "value": "360"
              },
              {
                "name": "Custom Availability Zones",
                "namespace": "aws:autoscaling:asg",
                "resource": "",
                "value": ""
              },
              {
                "name": "DefaultProcess",
                "namespace": "aws:elbv2:listener:443",
                "resource": "",
                "value": "default"
              },
              {
                "name": "DefaultProcess",
                "namespace": "aws:elbv2:listener:default",
                "resource": "",
                "value": "default"
              },
              {
                "name": "DefaultSSHPort",
                "namespace": "aws:elasticbeanstalk:control",
                "resource": "",
                "value": "22"
              },
              {
                "name": "DeleteOnTerminate",
                "namespace": "aws:elasticbeanstalk:cloudwatch:logs",
                "resource": "",
                "value": "false"
              },
              {
                "name": "DeleteOnTerminate",
                "namespace": "aws:elasticbeanstalk:cloudwatch:logs:health",
                "resource": "",
                "value": "false"
              },
              {
                "name": "DeploymentPolicy",
                "namespace": "aws:elasticbeanstalk:command",
                "resource": "",
                "value": "AllAtOnce"
              },
              {
                "name": "DeregistrationDelay",
                "namespace": "aws:elasticbeanstalk:environment:process:default",
                "resource": "",
                "value": "20"
              },
              {
                "name": "DisableIMDSv1",
                "namespace": "aws:autoscaling:launchconfiguration",
                "resource": "",
                "value": "true"
              },
              {
                "name": "EC2KeyName",
                "namespace": "aws:autoscaling:launchconfiguration",
                "resource": "",
                "value": ""
              },
              {
                "name": "ELBScheme",
                "namespace": "aws:ec2:vpc",
                "resource": "",
                "value": "public"
              },
              {
                "name": "ELBSubnets",
                "namespace": "aws:ec2:vpc",
                "resource": "",
                "value": "subnet-0055821a14ba6426e,subnet-01ec084b93589b74c"
              },
              {
                "name": "EnableCapacityRebalancing",
                "namespace": "aws:autoscaling:asg",
                "resource": "",
                "value": "false"
              },
              {
                "name": "EnableSpot",
                "namespace": "aws:ec2:instances",
                "resource": "",
                "value": "false"
              },
              {
                "name": "EnhancedHealthAuthEnabled",
                "namespace": "aws:elasticbeanstalk:healthreporting:system",
                "resource": "",
                "value": "true"
              },
              {
                "name": "EnvironmentType",
                "namespace": "aws:elasticbeanstalk:environment",
                "resource": "",
                "value": "LoadBalanced"
              },
              {
                "name": "EnvironmentVariables",
                "namespace": "aws:cloudformation:template:parameter",
                "resource": "",
                "value": ""
              },
              {
                "name": "EvaluationPeriods",
                "namespace": "aws:autoscaling:trigger",
                "resource": "",
                "value": "1"
              },
              {
                "name": "EvaluationTime",
                "namespace": "aws:elasticbeanstalk:trafficsplitting",
                "resource": "",
                "value": ""
              },
              {
                "name": "ExternalExtensionsS3Bucket",
                "namespace": "aws:elasticbeanstalk:environment",
                "resource": "",
                "value": ""
              },
              {
                "name": "ExternalExtensionsS3Key",
                "namespace": "aws:elasticbeanstalk:environment",
                "resource": "",
                "value": ""
              },
              {
                "name": "HasCoupledDatabase",
                "namespace": "aws:rds:dbinstance",
                "resource": "",
                "value": "false"
              },
              {
                "name": "HealthCheckInterval",
                "namespace": "aws:elasticbeanstalk:environment:process:default",
                "resource": "",
                "value": "15"
              },
              {
                "name": "HealthCheckPath",
                "namespace": "aws:elasticbeanstalk:environment:process:default",
                "resource": "",
                "value": "/"
              },
              {
                "name": "HealthCheckSuccessThreshold",
                "namespace": "aws:elasticbeanstalk:healthreporting:system",
                "resource": "",
                "value": "Ok"
              },
              {
                "name": "HealthCheckTimeout",
                "namespace": "aws:elasticbeanstalk:environment:process:default",
                "resource": "",
                "value": "5"
              },
              {
                "name": "HealthStreamingEnabled",
                "namespace": "aws:elasticbeanstalk:cloudwatch:logs:health",
                "resource": "",
                "value": "false"
              },
              {
                "name": "HealthyThresholdCount",
                "namespace": "aws:elasticbeanstalk:environment:process:default",
                "resource": "",
                "value": "3"
              },
              {
                "name": "HooksPkgUrl",
                "namespace": "aws:cloudformation:template:parameter",
                "resource": "",
                "value": "https://elasticbeanstalk-platform-assets-eu-west-1.s3.eu-west-1.amazonaws.com/stalks/eb_docker_amazon_linux_2023_1.0.611.0_20240513193348/lib/hooks.tar.gz"
              },
              {
                "name": "IamInstanceProfile",
                "namespace": "aws:autoscaling:launchconfiguration",
                "resource": "",
                "value": "aws-elasticbeanstalk-ec2-instance-profile"
              },
              {
                "name": "IdleTimeout",
                "namespace": "aws:elbv2:loadbalancer",
                "resource": "",
                "value": ""
              },
              {
                "name": "IgnoreHealthCheck",
                "namespace": "aws:elasticbeanstalk:command",
                "resource": "",
                "value": "false"
              },
              {
                "name": "ImageId",
                "namespace": "aws:autoscaling:launchconfiguration",
                "resource": "",
                "value": "ami-08a2677e4601ac94a"
              },
              {
                "name": "InstancePort",
                "namespace": "aws:cloudformation:template:parameter",
                "resource": "",
                "value": "80"
              },
              {
                "name": "InstanceRefreshEnabled",
                "namespace": "aws:elasticbeanstalk:managedactions:platformupdate",
                "resource": "",
                "value": "false"
              },
              {
                "name": "InstanceType",
                "namespace": "aws:autoscaling:launchconfiguration",
                "resource": "",
                "value": "t3.small"
              },
              {
                "name": "InstanceTypeFamily",
                "namespace": "aws:cloudformation:template:parameter",
                "resource": "",
                "value": "t3"
              },
              {
                "name": "InstanceTypes",
                "namespace": "aws:ec2:instances",
                "resource": "",
                "value": "t3.small"
              },
              {
                "name": "LaunchTemplateTagPropagationEnabled",
                "namespace": "aws:autoscaling:launchconfiguration",
                "resource": "",
                "value": ""
              },
              {
                "name": "LaunchTimeout",
                "namespace": "aws:elasticbeanstalk:control",
                "resource": "",
                "value": "0"
              },
              {
                "name": "LaunchType",
                "namespace": "aws:elasticbeanstalk:control",
                "resource": "",
                "value": "Migration"
              },
              {
                "name": "ListenerEnabled",
                "namespace": "aws:elbv2:listener:443",
                "resource": "",
                "value": "true"
              },
              {
                "name": "ListenerEnabled",
                "namespace": "aws:elbv2:listener:default",
                "resource": "",
                "value": "true"
              },
              {
                "name": "LoadBalancerIsShared",
                "namespace": "aws:elasticbeanstalk:environment",
                "resource": "",
                "value": "false"
              },
              {
                "name": "LoadBalancerType",
                "namespace": "aws:elasticbeanstalk:environment",
                "resource": "",
                "value": "application"
              },
              {
                "name": "LogPublicationControl",
                "namespace": "aws:elasticbeanstalk:hostmanager",
                "resource": "",
                "value": "false"
              },
              {
                "name": "LowerBreachScaleIncrement",
                "namespace": "aws:autoscaling:trigger",
                "resource": "",
                "value": "-1"
              },
              {
                "name": "LowerThreshold",
                "namespace": "aws:autoscaling:trigger",
                "resource": "",
                "value": "2000000"
              },
              {
                "name": "ManagedActionsEnabled",
                "namespace": "aws:elasticbeanstalk:managedactions",
                "resource": "",
                "value": "false"
              },
              {
                "name": "MatcherHTTPCode",
                "namespace": "aws:elasticbeanstalk:environment:process:default",
                "resource": "",
                "value": ""
              },
              {
                "name": "MaxBatchSize",
                "namespace": "aws:autoscaling:updatepolicy:rollingupdate",
                "resource": "",
                "value": ""
              },
              {
                "name": "MaxSize",
                "namespace": "aws:autoscaling:asg",
                "resource": "",
                "value": "4"
              },
              {
                "name": "MeasureName",
                "namespace": "aws:autoscaling:trigger",
                "resource": "",
                "value": "NetworkOut"
              },
              {
                "name": "MinInstancesInService",
                "namespace": "aws:autoscaling:updatepolicy:rollingupdate",
                "resource": "",
                "value": ""
              },
              {
                "name": "MinSize",
                "namespace": "aws:autoscaling:asg",
                "resource": "",
                "value": "1"
              },
              {
                "name": "MonitoringInterval",
                "namespace": "aws:autoscaling:launchconfiguration",
                "resource": "",
                "value": "5 minute"
              },
              {
                "name": "NewVersionPercent",
                "namespace": "aws:elasticbeanstalk:trafficsplitting",
                "resource": "",
                "value": ""
              },
              {
                "name": "Notification Endpoint",
                "namespace": "aws:elasticbeanstalk:sns:topics",
                "resource": "",
                "value": ""
              },
              {
                "name": "Notification Protocol",
                "namespace": "aws:elasticbeanstalk:sns:topics",
                "resource": "",
                "value": "email"
              },
              {
                "name": "Notification Topic ARN",
                "namespace": "aws:elasticbeanstalk:sns:topics",
                "resource": "",
                "value": ""
              },
              {
                "name": "Notification Topic Name",
                "namespace": "aws:elasticbeanstalk:sns:topics",
                "resource": "",
                "value": ""
              },
              {
                "name": "PauseTime",
                "namespace": "aws:autoscaling:updatepolicy:rollingupdate",
                "resource": "",
                "value": ""
              },
              {
                "name": "Period",
                "namespace": "aws:autoscaling:trigger",
                "resource": "",
                "value": "5"
              },
              {
                "name": "Port",
                "namespace": "aws:elasticbeanstalk:environment:process:default",
                "resource": "",
                "value": "80"
              },
              {
                "name": "PreferredStartTime",
                "namespace": "aws:elasticbeanstalk:managedactions",
                "resource": "",
                "value": ""
              },
              {
                "name": "Protocol",
                "namespace": "aws:elasticbeanstalk:environment:process:default",
                "resource": "",
                "value": "HTTP"
              },
              {
                "name": "Protocol",
                "namespace": "aws:elbv2:listener:443",
                "resource": "",
                "value": "HTTPS"
              },
              {
                "name": "Protocol",
                "namespace": "aws:elbv2:listener:default",
                "resource": "",
                "value": "HTTP"
              },
              {
                "name": "ProxyServer",
                "namespace": "aws:elasticbeanstalk:environment:proxy",
                "resource": "",
                "value": "nginx"
              },
              {
                "name": "RetentionInDays",
                "namespace": "aws:elasticbeanstalk:cloudwatch:logs",
                "resource": "",
                "value": "7"
              },
              {
                "name": "RetentionInDays",
                "namespace": "aws:elasticbeanstalk:cloudwatch:logs:health",
                "resource": "",
                "value": "7"
              },
              {
                "name": "RollbackLaunchOnFailure",
                "namespace": "aws:elasticbeanstalk:control",
                "resource": "",
                "value": "false"
              },
              {
                "name": "RollingUpdateEnabled",
                "namespace": "aws:autoscaling:updatepolicy:rollingupdate",
                "resource": "",
                "value": "false"
              },
              {
                "name": "RollingUpdateType",
                "namespace": "aws:autoscaling:updatepolicy:rollingupdate",
                "resource": "",
                "value": "Time"
              },
              {
                "name": "RootVolumeIOPS",
                "namespace": "aws:autoscaling:launchconfiguration",
                "resource": "",
                "value": ""
              },
              {
                "name": "RootVolumeSize",
                "namespace": "aws:autoscaling:launchconfiguration",
                "resource": "",
                "value": ""
              },
              {
                "name": "RootVolumeThroughput",
                "namespace": "aws:autoscaling:launchconfiguration",
                "resource": "",
                "value": ""
              },
              {
                "name": "RootVolumeType",
                "namespace": "aws:autoscaling:launchconfiguration",
                "resource": "",
                "value": ""
              },
              {
                "name": "Rules",
                "namespace": "aws:elbv2:listener:443",
                "resource": "",
                "value": ""
              },
              {
                "name": "Rules",
                "namespace": "aws:elbv2:listener:default",
                "resource": "",
                "value": ""
              },
              {
                "name": "SSHSourceRestriction",
                "namespace": "aws:autoscaling:launchconfiguration",
                "resource": "",
                "value": "tcp,22,22,0.0.0.0/0"
              },
              {
                "name": "SSLCertificateArns",
                "namespace": "aws:elbv2:listener:443",
                "resource": "",
                "value": "arn:aws:acm:eu-west-1:884878220922:certificate/a68268a2-ca34-440c-bd1b-032efddaf37b"
              },
              {
                "name": "SSLCertificateArns",
                "namespace": "aws:elbv2:listener:default",
                "resource": "",
                "value": ""
              },
              {
                "name": "SSLPolicy",
                "namespace": "aws:elbv2:listener:443",
                "resource": "",
                "value": "ELBSecurityPolicy-2016-08"
              },
              {
                "name": "SSLPolicy",
                "namespace": "aws:elbv2:listener:default",
                "resource": "",
                "value": ""
              },
              {
                "name": "SecurityGroups",
                "namespace": "aws:autoscaling:launchconfiguration",
                "resource": "",
                "value": "sg-0c087152bef9b6cbd"
              },
              {
                "name": "SecurityGroups",
                "namespace": "aws:elbv2:loadbalancer",
                "resource": "",
                "value": "sg-0c087152bef9b6cbd"
              },
              {
                "name": "ServiceRole",
                "namespace": "aws:elasticbeanstalk:environment",
                "resource": "",
                "value": "arn:aws:iam::884878220922:role/swapapp-dev-role"
              },
              {
                "name": "ServiceRoleForManagedUpdates",
                "namespace": "aws:elasticbeanstalk:managedactions",
                "resource": "",
                "value": "arn:aws:iam::884878220922:role/swapapp-dev-role"
              },
              {
                "name": "SpotFleetOnDemandAboveBasePercentage",
                "namespace": "aws:ec2:instances",
                "resource": "",
                "value": "70"
              },
              {
                "name": "SpotFleetOnDemandBase",
                "namespace": "aws:ec2:instances",
                "resource": "",
                "value": "0"
              },
              {
                "name": "SpotMaxPrice",
                "namespace": "aws:ec2:instances",
                "resource": "",
                "value": ""
              },
              {
                "name": "Statistic",
                "namespace": "aws:autoscaling:trigger",
                "resource": "",
                "value": "Average"
              },
              {
                "name": "StickinessEnabled",
                "namespace": "aws:elasticbeanstalk:environment:process:default",
                "resource": "",
                "value": "false"
              },
              {
                "name": "StickinessLBCookieDuration",
                "namespace": "aws:elasticbeanstalk:environment:process:default",
                "resource": "",
                "value": "86400"
              },
              {
                "name": "StickinessType",
                "namespace": "aws:elasticbeanstalk:environment:process:default",
                "resource": "",
                "value": "lb_cookie"
              },
              {
                "name": "StreamLogs",
                "namespace": "aws:elasticbeanstalk:cloudwatch:logs",
                "resource": "",
                "value": "false"
              },
              {
                "name": "Subnets",
                "namespace": "aws:ec2:vpc",
                "resource": "",
                "value": "subnet-0055821a14ba6426e,subnet-01ec084b93589b74c"
              },
              {
                "name": "SupportedArchitectures",
                "namespace": "aws:ec2:instances",
                "resource": "",
                "value": "x86_64"
              },
              {
                "name": "SystemType",
                "namespace": "aws:elasticbeanstalk:healthreporting:system",
                "resource": "",
                "value": "enhanced"
              },
              {
                "name": "Timeout",
                "namespace": "aws:autoscaling:updatepolicy:rollingupdate",
                "resource": "",
                "value": "PT30M"
              },
              {
                "name": "Timeout",
                "namespace": "aws:elasticbeanstalk:command",
                "resource": "",
                "value": "600"
              },
              {
                "name": "UnhealthyThresholdCount",
                "namespace": "aws:elasticbeanstalk:environment:process:default",
                "resource": "",
                "value": "5"
              },
              {
                "name": "Unit",
                "namespace": "aws:autoscaling:trigger",
                "resource": "",
                "value": "Bytes"
              },
              {
                "name": "UpdateLevel",
                "namespace": "aws:elasticbeanstalk:managedactions:platformupdate",
                "resource": "",
                "value": ""
              },
              {
                "name": "UpperBreachScaleIncrement",
                "namespace": "aws:autoscaling:trigger",
                "resource": "",
                "value": "1"
              },
              {
                "name": "UpperThreshold",
                "namespace": "aws:autoscaling:trigger",
                "resource": "",
                "value": "6000000"
              },
              {
                "name": "VPCId",
                "namespace": "aws:ec2:vpc",
                "resource": "",
                "value": "vpc-035ed49b3d80ac227"
              },
              {
                "name": "XRayEnabled",
                "namespace": "aws:elasticbeanstalk:xray",
                "resource": "",
                "value": "false"
              }
            ],
            "application": "swapapp-dev",
            "arn": "arn:aws:elasticbeanstalk:eu-west-1:884878220922:environment/swapapp-dev/swapapp-dev-dev",
            "autoscaling_groups": [
              "awseb-e-8jh55e2tug-stack-AWSEBAutoScalingGroup-t6N2rSnXqSXc"
            ],
            "cname": "swapapp-dev-dev.eba-tfafgvyc.eu-west-1.elasticbeanstalk.com",
            "cname_prefix": "",
            "description": "",
            "endpoint_url": "awseb--AWSEB-Apdi6G8imhfQ-709082568.eu-west-1.elb.amazonaws.com",
            "id": "e-8jh55e2tug",
            "instances": [
              "i-0a6dd1c54cbb1acf1"
            ],
            "launch_configurations": [
              "awseb-e-8jh55e2tug-stack-AWSEBAutoScalingLaunchConfiguration-XYT0EAiVyVXO"
            ],
            "load_balancers": [
              "arn:aws:elasticloadbalancing:eu-west-1:884878220922:loadbalancer/app/awseb--AWSEB-Apdi6G8imhfQ/7871b3379c770be1"
            ],
            "name": "swapapp-dev-dev",
            "platform_arn": "arn:aws:elasticbeanstalk:eu-west-1::platform/Docker running on 64bit Amazon Linux 2023/4.3.2",
            "poll_interval": null,
            "queues": [],
            "setting": [
              {
                "name": "EnvironmentType",
                "namespace": "aws:elasticbeanstalk:environment",
                "resource": "",
                "value": "LoadBalanced"
              },
              {
                "name": "IamInstanceProfile",
                "namespace": "aws:autoscaling:launchconfiguration",
                "resource": "",
                "value": "aws-elasticbeanstalk-ec2-instance-profile"
              },
              {
                "name": "InstanceTypes",
                "namespace": "aws:ec2:instances",
                "resource": "",
                "value": "t3.small"
              },
              {
                "name": "ListenerEnabled",
                "namespace": "aws:elbv2:listener:443",
                "resource": "",
                "value": "true"
              },
              {
                "name": "LoadBalancerType",
                "namespace": "aws:elasticbeanstalk:environment",
                "resource": "",
                "value": "application"
              },
              {
                "name": "Protocol",
                "namespace": "aws:elbv2:listener:443",
                "resource": "",
                "value": "HTTPS"
              },
              {
                "name": "SSLCertificateArns",
                "namespace": "aws:elbv2:listener:443",
                "resource": "",
                "value": "arn:aws:acm:eu-west-1:884878220922:certificate/a68268a2-ca34-440c-bd1b-032efddaf37b"
              },
              {
                "name": "SSLPolicy",
                "namespace": "aws:elbv2:listener:443",
                "resource": "",
                "value": "ELBSecurityPolicy-2016-08"
              },
              {
                "name": "SecurityGroups",
                "namespace": "aws:autoscaling:launchconfiguration",
                "resource": "",
                "value": "sg-0c087152bef9b6cbd"
              },
              {
                "name": "SecurityGroups",
                "namespace": "aws:elbv2:loadbalancer",
                "resource": "",
                "value": "sg-0c087152bef9b6cbd"
              },
              {
                "name": "ServiceRole",
                "namespace": "aws:elasticbeanstalk:environment",
                "resource": "",
                "value": "arn:aws:iam::884878220922:role/swapapp-dev-role"
              },
              {
                "name": "Subnets",
                "namespace": "aws:ec2:vpc",
                "resource": "",
                "value": "subnet-01ec084b93589b74c,subnet-0055821a14ba6426e"
              },
              {
                "name": "VPCId",
                "namespace": "aws:ec2:vpc",
                "resource": "",
                "value": "vpc-035ed49b3d80ac227"
              }
            ],
            "solution_stack_name": "64bit Amazon Linux 2023 v4.3.2 running Docker",
            "tags": {
              "environment-name": "swapapp-dev-dev"
            },
            "tags_all": {
              "environment-name": "swapapp-dev-dev"
            },
            "template_name": null,
            "tier": "WebServer",
            "triggers": [],
            "version_label": "swapapp-dev-dev-1.943",
            "wait_for_ready_timeout": "20m"
          },
          "sensitive_attributes": [],
          "private": "eyJzY2hlbWFfdmVyc2lvbiI6IjEifQ==",
          "dependencies": [
            "module.acm.aws_acm_certificate.web_cert",
            "module.beanstalk.aws_elastic_beanstalk_application.ebslab_app",
            "module.beanstalk.aws_elastic_beanstalk_application_version.app_version",
            "module.beanstalk.aws_iam_instance_profile.instance_profile",
            "module.beanstalk.aws_s3_bucket.dockerrun_bucket",
            "module.beanstalk.aws_s3_object.application_zip",
            "module.iam.aws_iam_role.ebslab_role",
            "module.vpc.aws_security_group.ebslab_security_group",
            "module.vpc.aws_subnet.ebslab_subnets",
            "module.vpc.aws_vpc.ebslab_vpc",
            "module.vpc.data.aws_availability_zones.available"
          ]
        }
      ]
    },
    {
      "module": "module.beanstalk",
      "mode": "managed",
      "type": "aws_iam_instance_profile",
      "name": "instance_profile",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "arn": "arn:aws:iam::884878220922:instance-profile/aws-elasticbeanstalk-ec2-instance-profile",
            "create_date": "2024-05-29T11:52:10Z",
            "id": "aws-elasticbeanstalk-ec2-instance-profile",
            "name": "aws-elasticbeanstalk-ec2-instance-profile",
            "name_prefix": null,
            "path": "/",
            "role": "aws-elasticbeanstalk-ec2-role",
            "tags": null,
            "tags_all": {},
            "unique_id": "AIPA44BW2DZ5IUO4YOLG4"
          },
          "sensitive_attributes": [],
          "private": "bnVsbA=="
        }
      ]
    },
    {
      "module": "module.beanstalk",
      "mode": "managed",
      "type": "aws_route53_record",
      "name": "front_end",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 2,
          "attributes": {
            "alias": [
              {
                "evaluate_target_health": true,
                "name": "awseb--awseb-apdi6g8imhfq-709082568.eu-west-1.elb.amazonaws.com",
                "zone_id": "Z32O12XQLNTSW2"
              }
            ],
            "allow_overwrite": null,
            "failover_routing_policy": [],
            "fqdn": "swapapp.net",
            "geolocation_routing_policy": [],
            "health_check_id": null,
            "id": "Z06784731O4L20UC9OP71_swapapp.net_A",
            "latency_routing_policy": [],
            "multivalue_answer_routing_policy": null,
            "name": "swapapp.net",
            "records": null,
            "set_identifier": null,
            "ttl": null,
            "type": "A",
            "weighted_routing_policy": [],
            "zone_id": "Z06784731O4L20UC9OP71"
          },
          "sensitive_attributes": [],
          "private": "eyJzY2hlbWFfdmVyc2lvbiI6IjIifQ==",
          "dependencies": [
            "module.acm.aws_acm_certificate.web_cert",
            "module.beanstalk.aws_elastic_beanstalk_application.ebslab_app",
            "module.beanstalk.aws_elastic_beanstalk_application_version.app_version",
            "module.beanstalk.aws_elastic_beanstalk_environment.ebslab_env",
            "module.beanstalk.aws_iam_instance_profile.instance_profile",
            "module.beanstalk.aws_s3_bucket.dockerrun_bucket",
            "module.beanstalk.aws_s3_object.application_zip",
            "module.beanstalk.data.aws_lb.front_end",
            "module.iam.aws_iam_role.ebslab_role",
            "module.route53_zone.aws_route53_zone.ebs-lab",
            "module.vpc.aws_security_group.ebslab_security_group",
            "module.vpc.aws_subnet.ebslab_subnets",
            "module.vpc.aws_vpc.ebslab_vpc",
            "module.vpc.data.aws_availability_zones.available"
          ]
        }
      ]
    },
    {
      "module": "module.beanstalk",
      "mode": "managed",
      "type": "aws_s3_bucket",
      "name": "dockerrun_bucket",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "acceleration_status": "",
            "acl": null,
            "arn": "arn:aws:s3:::swapapp-dev-bucket",
            "bucket": "swapapp-dev-bucket",
            "bucket_domain_name": "swapapp-dev-bucket.s3.amazonaws.com",
            "bucket_prefix": null,
            "bucket_regional_domain_name": "swapapp-dev-bucket.s3.eu-west-1.amazonaws.com",
            "cors_rule": [],
            "force_destroy": false,
            "grant": [
              {
                "id": "e8f6279965f464eb6510170228211e3220f0dc753fd54fd93f0a385ec84e9477",
                "permissions": [
                  "FULL_CONTROL"
                ],
                "type": "CanonicalUser",
                "uri": ""
              }
            ],
            "hosted_zone_id": "Z1BKCTXD74EZPE",
            "id": "swapapp-dev-bucket",
            "lifecycle_rule": [],
            "logging": [],
            "object_lock_configuration": [],
            "object_lock_enabled": false,
            "policy": "",
            "region": "eu-west-1",
            "replication_configuration": [],
            "request_payer": "BucketOwner",
            "server_side_encryption_configuration": [
              {
                "rule": [
                  {
                    "apply_server_side_encryption_by_default": [
                      {
                        "kms_master_key_id": "",
                        "sse_algorithm": "AES256"
                      }
                    ],
                    "bucket_key_enabled": false
                  }
                ]
              }
            ],
            "tags": {
              "elasticbeanstalk:environment-name": "swapapp-dev-dev"
            },
            "tags_all": {
              "elasticbeanstalk:environment-name": "swapapp-dev-dev"
            },
            "versioning": [
              {
                "enabled": false,
                "mfa_delete": false
              }
            ],
            "website": [],
            "website_domain": null,
            "website_endpoint": null
          },
          "sensitive_attributes": [],
          "private": "bnVsbA=="
        }
      ]
    },
    {
      "module": "module.beanstalk",
      "mode": "managed",
      "type": "aws_s3_object",
      "name": "application_zip",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "acl": "private",
            "bucket": "swapapp-dev-bucket",
            "bucket_key_enabled": false,
            "cache_control": "",
            "content": null,
            "content_base64": null,
            "content_disposition": "",
            "content_encoding": "",
            "content_language": "",
            "content_type": "binary/octet-stream",
            "etag": "2279b7ac433029b6f5ef263c4465982b",
            "force_destroy": false,
            "id": "beanstalk/swapapp-1.943.zip",
            "key": "beanstalk/swapapp-1.943.zip",
            "kms_key_id": null,
            "metadata": null,
            "object_lock_legal_hold_status": "",
            "object_lock_mode": "",
            "object_lock_retain_until_date": "",
            "server_side_encryption": "AES256",
            "source": "swapapp-1.943.zip",
            "source_hash": null,
            "storage_class": "STANDARD",
            "tags": null,
            "tags_all": {},
            "version_id": "",
            "website_redirect": ""
          },
          "sensitive_attributes": [],
          "private": "bnVsbA==",
          "dependencies": [
            "module.beanstalk.aws_s3_bucket.dockerrun_bucket"
          ]
        }
      ]
    },
    {
      "module": "module.beanstalk",
      "mode": "managed",
      "type": "null_resource",
      "name": "copy_ssh_key",
      "provider": "provider[\"registry.terraform.io/hashicorp/null\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "id": "8742736326269810494",
            "triggers": null
          },
          "sensitive_attributes": [],
          "dependencies": [
            "module.beanstalk.null_resource.prepare_directories"
          ]
        }
      ]
    },
    {
      "module": "module.beanstalk",
      "mode": "managed",
      "type": "null_resource",
      "name": "prepare_directories",
      "provider": "provider[\"registry.terraform.io/hashicorp/null\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "id": "4991889053171047480",
            "triggers": null
          },
          "sensitive_attributes": []
        }
      ]
    },
    {
      "module": "module.beanstalk",
      "mode": "managed",
      "type": "null_resource",
      "name": "zip_application",
      "provider": "provider[\"registry.terraform.io/hashicorp/null\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "id": "4265510713226649486",
            "triggers": {
              "version": "1.943"
            }
          },
          "sensitive_attributes": [],
          "dependencies": [
            "module.beanstalk.null_resource.copy_ssh_key",
            "module.beanstalk.null_resource.prepare_directories"
          ]
        }
      ]
    },
    {
      "module": "module.iam",
      "mode": "managed",
      "type": "aws_iam_policy",
      "name": "awseb_full_access",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "arn": "arn:aws:iam::884878220922:policy/AWSElasticBeanstalkFullAccess",
            "description": "Provides full access to AWS Elastic Beanstalk",
            "id": "arn:aws:iam::884878220922:policy/AWSElasticBeanstalkFullAccess",
            "name": "AWSElasticBeanstalkFullAccess",
            "name_prefix": null,
            "path": "/",
            "policy": "{\"Statement\":[{\"Action\":\"elasticbeanstalk:*\",\"Effect\":\"Allow\",\"Resource\":\"*\"}],\"Version\":\"2012-10-17\"}",
            "policy_id": "ANPA44BW2DZ5JCDQZXYQM",
            "tags": null,
            "tags_all": {}
          },
          "sensitive_attributes": [],
          "private": "bnVsbA=="
        }
      ]
    },
    {
      "module": "module.iam",
      "mode": "managed",
      "type": "aws_iam_role",
      "name": "beanstalk_ec2_role",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "arn": "arn:aws:iam::884878220922:role/aws-elasticbeanstalk-ec2-role",
            "assume_role_policy": "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"ec2.amazonaws.com\"},\"Action\":\"sts:AssumeRole\"}]}",
            "create_date": "2024-05-29T11:52:11Z",
            "description": "",
            "force_detach_policies": false,
            "id": "aws-elasticbeanstalk-ec2-role",
            "inline_policy": [
              {
                "name": "",
                "policy": ""
              }
            ],
            "managed_policy_arns": [],
            "max_session_duration": 3600,
            "name": "aws-elasticbeanstalk-ec2-role",
            "name_prefix": "",
            "path": "/",
            "permissions_boundary": null,
            "tags": null,
            "tags_all": {},
            "unique_id": "AROA44BW2DZ5AAHGODNS7"
          },
          "sensitive_attributes": [],
          "private": "bnVsbA=="
        }
      ]
    },
    {
      "module": "module.iam",
      "mode": "managed",
      "type": "aws_iam_role",
      "name": "ebslab_role",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "arn": "arn:aws:iam::884878220922:role/swapapp-dev-role",
            "assume_role_policy": "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"elasticbeanstalk.amazonaws.com\"},\"Action\":\"sts:AssumeRole\"},{\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"ec2.amazonaws.com\"},\"Action\":\"sts:AssumeRole\"}]}",
            "create_date": "2024-05-29T11:52:11Z",
            "description": "",
            "force_detach_policies": false,
            "id": "swapapp-dev-role",
            "inline_policy": [
              {
                "name": "",
                "policy": ""
              }
            ],
            "managed_policy_arns": [],
            "max_session_duration": 3600,
            "name": "swapapp-dev-role",
            "name_prefix": "",
            "path": "/",
            "permissions_boundary": null,
            "tags": null,
            "tags_all": {},
            "unique_id": "AROA44BW2DZ5AGDOCEZLY"
          },
          "sensitive_attributes": [],
          "private": "bnVsbA=="
        }
      ]
    },
    {
      "module": "module.iam",
      "mode": "managed",
      "type": "aws_iam_role_policy_attachment",
      "name": "beanstalk_multicontainer_docker",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "id": "aws-elasticbeanstalk-ec2-role-20240529115212282700000003",
            "policy_arn": "arn:aws:iam::aws:policy/AWSElasticBeanstalkMulticontainerDocker",
            "role": "aws-elasticbeanstalk-ec2-role"
          },
          "sensitive_attributes": [],
          "private": "bnVsbA==",
          "dependencies": [
            "module.iam.aws_iam_role.beanstalk_ec2_role"
          ]
        }
      ]
    },
    {
      "module": "module.iam",
      "mode": "managed",
      "type": "aws_iam_role_policy_attachment",
      "name": "beanstalk_web_tier",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "id": "aws-elasticbeanstalk-ec2-role-20240529115212317900000005",
            "policy_arn": "arn:aws:iam::aws:policy/AWSElasticBeanstalkWebTier",
            "role": "aws-elasticbeanstalk-ec2-role"
          },
          "sensitive_attributes": [],
          "private": "bnVsbA==",
          "dependencies": [
            "module.iam.aws_iam_role.beanstalk_ec2_role"
          ]
        }
      ]
    },
    {
      "module": "module.iam",
      "mode": "managed",
      "type": "aws_iam_role_policy_attachment",
      "name": "beanstalk_worker_tier",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "id": "aws-elasticbeanstalk-ec2-role-20240529115212283000000004",
            "policy_arn": "arn:aws:iam::aws:policy/AWSElasticBeanstalkWorkerTier",
            "role": "aws-elasticbeanstalk-ec2-role"
          },
          "sensitive_attributes": [],
          "private": "bnVsbA==",
          "dependencies": [
            "module.iam.aws_iam_role.beanstalk_ec2_role"
          ]
        }
      ]
    },
    {
      "module": "module.iam",
      "mode": "managed",
      "type": "aws_iam_role_policy_attachment",
      "name": "ebslab_beanstalk_policy_attachment",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "id": "swapapp-dev-role-20240529115212365500000006",
            "policy_arn": "arn:aws:iam::884878220922:policy/AWSElasticBeanstalkFullAccess",
            "role": "swapapp-dev-role"
          },
          "sensitive_attributes": [],
          "private": "bnVsbA==",
          "dependencies": [
            "module.iam.aws_iam_policy.awseb_full_access",
            "module.iam.aws_iam_role.ebslab_role"
          ]
        }
      ]
    },
    {
      "module": "module.iam",
      "mode": "managed",
      "type": "aws_iam_role_policy_attachment",
      "name": "ebslab_ec2_policy_attachment",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "id": "swapapp-dev-role-20240529115212493900000007",
            "policy_arn": "arn:aws:iam::aws:policy/AmazonEC2FullAccess",
            "role": "swapapp-dev-role"
          },
          "sensitive_attributes": [],
          "private": "bnVsbA==",
          "dependencies": [
            "module.iam.aws_iam_role.ebslab_role"
          ]
        }
      ]
    },
    {
      "module": "module.rds",
      "mode": "managed",
      "type": "aws_db_instance",
      "name": "mysql_db",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 1,
          "attributes": {
            "address": "terraform-20240529115235085500000009.cl8gc6cyoexy.eu-west-1.rds.amazonaws.com",
            "allocated_storage": 10,
            "allow_major_version_upgrade": null,
            "apply_immediately": null,
            "arn": "arn:aws:rds:eu-west-1:884878220922:db:terraform-20240529115235085500000009",
            "auto_minor_version_upgrade": true,
            "availability_zone": "eu-west-1c",
            "backup_retention_period": 0,
            "backup_window": "02:46-03:16",
            "ca_cert_identifier": "rds-ca-rsa2048-g1",
            "character_set_name": "",
            "copy_tags_to_snapshot": false,
            "customer_owned_ip_enabled": false,
            "db_name": "my_application",
            "db_subnet_group_name": "terraform-20240529115233741100000008",
            "delete_automated_backups": true,
            "deletion_protection": false,
            "domain": "",
            "domain_iam_role_name": "",
            "enabled_cloudwatch_logs_exports": null,
            "endpoint": "terraform-20240529115235085500000009.cl8gc6cyoexy.eu-west-1.rds.amazonaws.com:3306",
            "engine": "mysql",
            "engine_version": "5.7",
            "engine_version_actual": "5.7.44",
            "final_snapshot_identifier": null,
            "hosted_zone_id": "Z29XKXDKYMONMX",
            "iam_database_authentication_enabled": false,
            "id": "terraform-20240529115235085500000009",
            "identifier": "terraform-20240529115235085500000009",
            "identifier_prefix": "terraform-",
            "instance_class": "db.t3.micro",
            "iops": 0,
            "kms_key_id": "",
            "latest_restorable_time": "0001-01-01T00:00:00Z",
            "license_model": "general-public-license",
            "maintenance_window": "sun:23:06-sun:23:36",
            "max_allocated_storage": 0,
            "monitoring_interval": 0,
            "monitoring_role_arn": "",
            "multi_az": false,
            "name": "my_application",
            "nchar_character_set_name": "",
            "option_group_name": "default:mysql-5-7",
            "parameter_group_name": "default.mysql5.7",
            "password": "password",
            "performance_insights_enabled": false,
            "performance_insights_kms_key_id": "",
            "performance_insights_retention_period": 0,
            "port": 3306,
            "publicly_accessible": false,
            "replica_mode": "",
            "replicas": [],
            "replicate_source_db": "",
            "resource_id": "db-LOY5TI6HWZPPOP5BYRKPOKWPE4",
            "restore_to_point_in_time": [],
            "s3_import": [],
            "security_group_names": null,
            "skip_final_snapshot": true,
            "snapshot_identifier": null,
            "status": "available",
            "storage_encrypted": false,
            "storage_type": "gp2",
            "tags": null,
            "tags_all": {},
            "timeouts": null,
            "timezone": "",
            "username": "root",
            "vpc_security_group_ids": [
              "sg-0c087152bef9b6cbd"
            ]
          },
          "sensitive_attributes": [],
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjoyNDAwMDAwMDAwMDAwLCJkZWxldGUiOjM2MDAwMDAwMDAwMDAsInVwZGF0ZSI6NDgwMDAwMDAwMDAwMH0sInNjaGVtYV92ZXJzaW9uIjoiMSJ9",
          "dependencies": [
            "module.rds.aws_db_subnet_group.db_subnet_group",
            "module.vpc.aws_security_group.ebslab_security_group",
            "module.vpc.aws_subnet.ebslab_subnets",
            "module.vpc.aws_vpc.ebslab_vpc",
            "module.vpc.data.aws_availability_zones.available"
          ]
        }
      ]
    },
    {
      "module": "module.rds",
      "mode": "managed",
      "type": "aws_db_subnet_group",
      "name": "db_subnet_group",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "arn": "arn:aws:rds:eu-west-1:884878220922:subgrp:terraform-20240529115233741100000008",
            "description": "Managed by Terraform",
            "id": "terraform-20240529115233741100000008",
            "name": "terraform-20240529115233741100000008",
            "name_prefix": null,
            "subnet_ids": [
              "subnet-0014540d42edbfbd7",
              "subnet-0ea4e1fd7570b534d"
            ],
            "tags": {
              "Name": "MySQL DB Subnet Group"
            },
            "tags_all": {
              "Name": "MySQL DB Subnet Group"
            }
          },
          "sensitive_attributes": [],
          "private": "bnVsbA==",
          "dependencies": [
            "module.vpc.aws_subnet.ebslab_subnets",
            "module.vpc.aws_vpc.ebslab_vpc",
            "module.vpc.data.aws_availability_zones.available"
          ]
        }
      ]
    },
    {
      "module": "module.route53_rds_record",
      "mode": "managed",
      "type": "aws_route53_record",
      "name": "rds-ns",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 2,
          "attributes": {
            "alias": [],
            "allow_overwrite": null,
            "failover_routing_policy": [],
            "fqdn": "rds-dev.swapapp.net",
            "geolocation_routing_policy": [],
            "health_check_id": null,
            "id": "Z06784731O4L20UC9OP71_rds-dev_CNAME",
            "latency_routing_policy": [],
            "multivalue_answer_routing_policy": null,
            "name": "rds-dev",
            "records": [
              "terraform-20240529115235085500000009.cl8gc6cyoexy.eu-west-1.rds.amazonaws.com"
            ],
            "set_identifier": null,
            "ttl": 15,
            "type": "CNAME",
            "weighted_routing_policy": [],
            "zone_id": "Z06784731O4L20UC9OP71"
          },
          "sensitive_attributes": [],
          "private": "eyJzY2hlbWFfdmVyc2lvbiI6IjIifQ==",
          "dependencies": [
            "module.rds.aws_db_instance.mysql_db",
            "module.rds.aws_db_subnet_group.db_subnet_group",
            "module.route53_zone.aws_route53_zone.ebs-lab",
            "module.vpc.aws_security_group.ebslab_security_group",
            "module.vpc.aws_subnet.ebslab_subnets",
            "module.vpc.aws_vpc.ebslab_vpc",
            "module.vpc.data.aws_availability_zones.available"
          ]
        }
      ]
    },
    {
      "module": "module.route53_registered_domains",
      "mode": "managed",
      "type": "aws_route53domains_registered_domain",
      "name": "web_name_servers",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "abuse_contact_email": "abuse@registrar.amazon.com",
            "abuse_contact_phone": "+1.2062661000",
            "admin_contact": [
              {
                "address_line_1": "Hazohar 4",
                "address_line_2": "",
                "city": "Petah Tiqwa",
                "contact_type": "PERSON",
                "country_code": "IL",
                "email": "davidmelamed269@gmail.com",
                "extra_params": {},
                "fax": "",
                "first_name": "David",
                "last_name": "Melamed",
                "organization_name": "",
                "phone_number": "+972.0527555492",
                "state": "",
                "zip_code": "4958069"
              }
            ],
            "admin_privacy": true,
            "auto_renew": true,
            "creation_date": "2024-05-18T11:36:24Z",
            "domain_name": "swapapp.net",
            "expiration_date": "2025-05-18T11:36:24Z",
            "id": "swapapp.net",
            "name_server": [
              {
                "glue_ips": null,
                "name": "ns-1141.awsdns-14.org"
              },
              {
                "glue_ips": null,
                "name": "ns-2024.awsdns-61.co.uk"
              },
              {
                "glue_ips": null,
                "name": "ns-437.awsdns-54.com"
              },
              {
                "glue_ips": null,
                "name": "ns-999.awsdns-60.net"
              }
            ],
            "registrant_contact": [
              {
                "address_line_1": "Hazohar 4",
                "address_line_2": "",
                "city": "Petah Tiqwa",
                "contact_type": "PERSON",
                "country_code": "IL",
                "email": "davidmelamed269@gmail.com",
                "extra_params": {},
                "fax": "",
                "first_name": "David",
                "last_name": "Melamed",
                "organization_name": "",
                "phone_number": "+972.0527555492",
                "state": "",
                "zip_code": "4958069"
              }
            ],
            "registrant_privacy": true,
            "registrar_name": "Amazon Registrar, Inc.",
            "registrar_url": "http://registrar.amazon.com",
            "reseller": "",
            "status_list": [
              "clientDeleteProhibited",
              "clientTransferProhibited",
              "addPeriod",
              "clientUpdateProhibited"
            ],
            "tags": {
              "Environment": "dev"
            },
            "tags_all": {
              "Environment": "dev"
            },
            "tech_contact": [
              {
                "address_line_1": "Hazohar 4",
                "address_line_2": "",
                "city": "Petah Tiqwa",
                "contact_type": "PERSON",
                "country_code": "IL",
                "email": "davidmelamed269@gmail.com",
                "extra_params": {},
                "fax": "",
                "first_name": "David",
                "last_name": "Melamed",
                "organization_name": "",
                "phone_number": "+972.0527555492",
                "state": "",
                "zip_code": "4958069"
              }
            ],
            "tech_privacy": true,
            "timeouts": null,
            "transfer_lock": true,
            "updated_date": "2024-05-19T09:41:39Z",
            "whois_server": "whois.registrar.amazon.com"
          },
          "sensitive_attributes": [],
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjoxODAwMDAwMDAwMDAwLCJ1cGRhdGUiOjE4MDAwMDAwMDAwMDB9fQ==",
          "dependencies": [
            "module.route53_zone.aws_route53_zone.ebs-lab"
          ]
        }
      ]
    },
    {
      "module": "module.route53_zone",
      "mode": "managed",
      "type": "aws_route53_zone",
      "name": "ebs-lab",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "arn": "arn:aws:route53:::hostedzone/Z06784731O4L20UC9OP71",
            "comment": "Managed by Terraform",
            "delegation_set_id": "",
            "force_destroy": false,
            "id": "Z06784731O4L20UC9OP71",
            "name": "swapapp.net",
            "name_servers": [
              "ns-1141.awsdns-14.org",
              "ns-2024.awsdns-61.co.uk",
              "ns-437.awsdns-54.com",
              "ns-999.awsdns-60.net"
            ],
            "tags": {
              "Environment": "dev"
            },
            "tags_all": {
              "Environment": "dev"
            },
            "vpc": [],
            "zone_id": "Z06784731O4L20UC9OP71"
          },
          "sensitive_attributes": [],
          "private": "bnVsbA=="
        }
      ]
    },
    {
      "module": "module.vpc",
      "mode": "data",
      "type": "aws_availability_zones",
      "name": "available",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "all_availability_zones": null,
            "exclude_names": null,
            "exclude_zone_ids": null,
            "filter": null,
            "group_names": [
              "eu-west-1"
            ],
            "id": "eu-west-1",
            "names": [
              "eu-west-1a",
              "eu-west-1b",
              "eu-west-1c"
            ],
            "state": null,
            "zone_ids": [
              "euw1-az3",
              "euw1-az1",
              "euw1-az2"
            ]
          },
          "sensitive_attributes": []
        }
      ]
    },
    {
      "module": "module.vpc",
      "mode": "managed",
      "type": "aws_default_route_table",
      "name": "internal_ebslab_default",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "arn": "arn:aws:ec2:eu-west-1:884878220922:route-table/rtb-0310f0f71230a3234",
            "default_route_table_id": "rtb-0310f0f71230a3234",
            "id": "rtb-0310f0f71230a3234",
            "owner_id": "884878220922",
            "propagating_vgws": null,
            "route": [
              {
                "cidr_block": "0.0.0.0/0",
                "core_network_arn": "",
                "destination_prefix_list_id": "",
                "egress_only_gateway_id": "",
                "gateway_id": "igw-05392a0ae76dea600",
                "instance_id": "",
                "ipv6_cidr_block": "",
                "nat_gateway_id": "",
                "network_interface_id": "",
                "transit_gateway_id": "",
                "vpc_endpoint_id": "",
                "vpc_peering_connection_id": ""
              }
            ],
            "tags": {
              "Name": "ebs-lab"
            },
            "tags_all": {
              "Name": "ebs-lab"
            },
            "timeouts": null,
            "vpc_id": "vpc-035ed49b3d80ac227"
          },
          "sensitive_attributes": [],
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjoxMjAwMDAwMDAwMDAsInVwZGF0ZSI6MTIwMDAwMDAwMDAwfX0=",
          "dependencies": [
            "module.vpc.aws_internet_gateway.ebslab_gw",
            "module.vpc.aws_vpc.ebslab_vpc"
          ]
        }
      ]
    },
    {
      "module": "module.vpc",
      "mode": "managed",
      "type": "aws_internet_gateway",
      "name": "ebslab_gw",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "arn": "arn:aws:ec2:eu-west-1:884878220922:internet-gateway/igw-05392a0ae76dea600",
            "id": "igw-05392a0ae76dea600",
            "owner_id": "884878220922",
            "tags": {
              "Name": "ebs-lab"
            },
            "tags_all": {
              "Name": "ebs-lab"
            },
            "vpc_id": "vpc-035ed49b3d80ac227"
          },
          "sensitive_attributes": [],
          "private": "bnVsbA==",
          "dependencies": [
            "module.vpc.aws_vpc.ebslab_vpc"
          ]
        }
      ]
    },
    {
      "module": "module.vpc",
      "mode": "managed",
      "type": "aws_route_table_association",
      "name": "default",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "index_key": 0,
          "schema_version": 0,
          "attributes": {
            "gateway_id": "",
            "id": "rtbassoc-08f5293f10c3ef2a8",
            "route_table_id": "rtb-0310f0f71230a3234",
            "subnet_id": "subnet-01ec084b93589b74c"
          },
          "sensitive_attributes": [],
          "private": "bnVsbA==",
          "dependencies": [
            "module.vpc.aws_default_route_table.internal_ebslab_default",
            "module.vpc.aws_internet_gateway.ebslab_gw",
            "module.vpc.aws_subnet.ebslab_subnets",
            "module.vpc.aws_vpc.ebslab_vpc",
            "module.vpc.data.aws_availability_zones.available"
          ]
        },
        {
          "index_key": 1,
          "schema_version": 0,
          "attributes": {
            "gateway_id": "",
            "id": "rtbassoc-0ad1cc0cb7ab7db01",
            "route_table_id": "rtb-0310f0f71230a3234",
            "subnet_id": "subnet-0055821a14ba6426e"
          },
          "sensitive_attributes": [],
          "private": "bnVsbA==",
          "dependencies": [
            "module.vpc.aws_default_route_table.internal_ebslab_default",
            "module.vpc.aws_internet_gateway.ebslab_gw",
            "module.vpc.aws_subnet.ebslab_subnets",
            "module.vpc.aws_vpc.ebslab_vpc",
            "module.vpc.data.aws_availability_zones.available"
          ]
        }
      ]
    },
    {
      "module": "module.vpc",
      "mode": "managed",
      "type": "aws_security_group",
      "name": "ebslab_security_group",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 1,
          "attributes": {
            "arn": "arn:aws:ec2:eu-west-1:884878220922:security-group/sg-0c087152bef9b6cbd",
            "description": "Security group for Elastic Beanstalk",
            "egress": [],
            "id": "sg-0c087152bef9b6cbd",
            "ingress": [],
            "name": "swapapp-dev-sg",
            "name_prefix": "",
            "owner_id": "884878220922",
            "revoke_rules_on_delete": false,
            "tags": null,
            "tags_all": {},
            "timeouts": null,
            "vpc_id": "vpc-035ed49b3d80ac227"
          },
          "sensitive_attributes": [],
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjo2MDAwMDAwMDAwMDAsImRlbGV0ZSI6OTAwMDAwMDAwMDAwfSwic2NoZW1hX3ZlcnNpb24iOiIxIn0=",
          "dependencies": [
            "module.vpc.aws_vpc.ebslab_vpc"
          ]
        }
      ]
    },
    {
      "module": "module.vpc",
      "mode": "managed",
      "type": "aws_security_group_rule",
      "name": "ebslab_security_group_rule_80",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 2,
          "attributes": {
            "cidr_blocks": null,
            "description": null,
            "from_port": 80,
            "id": "sgrule-2564617021",
            "ipv6_cidr_blocks": null,
            "prefix_list_ids": null,
            "protocol": "tcp",
            "security_group_id": "sg-0c087152bef9b6cbd",
            "self": false,
            "source_security_group_id": "sg-0c087152bef9b6cbd",
            "to_port": 80,
            "type": "ingress"
          },
          "sensitive_attributes": [],
          "private": "eyJzY2hlbWFfdmVyc2lvbiI6IjIifQ==",
          "dependencies": [
            "module.vpc.aws_security_group.ebslab_security_group",
            "module.vpc.aws_vpc.ebslab_vpc"
          ]
        }
      ]
    },
    {
      "module": "module.vpc",
      "mode": "managed",
      "type": "aws_security_group_rule",
      "name": "ebslab_security_group_rule_ssh",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 2,
          "attributes": {
            "cidr_blocks": [
              "0.0.0.0/0"
            ],
            "description": null,
            "from_port": 22,
            "id": "sgrule-592614420",
            "ipv6_cidr_blocks": null,
            "prefix_list_ids": null,
            "protocol": "tcp",
            "security_group_id": "sg-0c087152bef9b6cbd",
            "self": false,
            "source_security_group_id": null,
            "to_port": 22,
            "type": "ingress"
          },
          "sensitive_attributes": [],
          "private": "eyJzY2hlbWFfdmVyc2lvbiI6IjIifQ==",
          "dependencies": [
            "module.vpc.aws_security_group.ebslab_security_group",
            "module.vpc.aws_vpc.ebslab_vpc"
          ]
        }
      ]
    },
    {
      "module": "module.vpc",
      "mode": "managed",
      "type": "aws_security_group_rule",
      "name": "ebslab_security_group_rule_ssl",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 2,
          "attributes": {
            "cidr_blocks": [
              "0.0.0.0/0"
            ],
            "description": null,
            "from_port": 443,
            "id": "sgrule-4085710998",
            "ipv6_cidr_blocks": null,
            "prefix_list_ids": null,
            "protocol": "tcp",
            "security_group_id": "sg-0c087152bef9b6cbd",
            "self": false,
            "source_security_group_id": null,
            "to_port": 443,
            "type": "ingress"
          },
          "sensitive_attributes": [],
          "private": "eyJzY2hlbWFfdmVyc2lvbiI6IjIifQ==",
          "dependencies": [
            "module.vpc.aws_security_group.ebslab_security_group",
            "module.vpc.aws_vpc.ebslab_vpc"
          ]
        }
      ]
    },
    {
      "module": "module.vpc",
      "mode": "managed",
      "type": "aws_security_group_rule",
      "name": "internal_mysql_communication",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 2,
          "attributes": {
            "cidr_blocks": null,
            "description": null,
            "from_port": 3306,
            "id": "sgrule-2838047466",
            "ipv6_cidr_blocks": null,
            "prefix_list_ids": null,
            "protocol": "tcp",
            "security_group_id": "sg-0c087152bef9b6cbd",
            "self": false,
            "source_security_group_id": "sg-0c087152bef9b6cbd",
            "to_port": 3306,
            "type": "ingress"
          },
          "sensitive_attributes": [],
          "private": "eyJzY2hlbWFfdmVyc2lvbiI6IjIifQ==",
          "dependencies": [
            "module.vpc.aws_security_group.ebslab_security_group",
            "module.vpc.aws_vpc.ebslab_vpc"
          ]
        }
      ]
    },
    {
      "module": "module.vpc",
      "mode": "managed",
      "type": "aws_subnet",
      "name": "ebslab_subnets",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "index_key": 0,
          "schema_version": 1,
          "attributes": {
            "arn": "arn:aws:ec2:eu-west-1:884878220922:subnet/subnet-01ec084b93589b74c",
            "assign_ipv6_address_on_creation": false,
            "availability_zone": "eu-west-1a",
            "availability_zone_id": "euw1-az3",
            "cidr_block": "10.0.1.0/24",
            "customer_owned_ipv4_pool": "",
            "enable_dns64": false,
            "enable_resource_name_dns_a_record_on_launch": false,
            "enable_resource_name_dns_aaaa_record_on_launch": false,
            "id": "subnet-01ec084b93589b74c",
            "ipv6_cidr_block": "",
            "ipv6_cidr_block_association_id": "",
            "ipv6_native": false,
            "map_customer_owned_ip_on_launch": false,
            "map_public_ip_on_launch": true,
            "outpost_arn": "",
            "owner_id": "884878220922",
            "private_dns_hostname_type_on_launch": "ip-name",
            "tags": {
              "Name": "Public-Subnet"
            },
            "tags_all": {
              "Name": "Public-Subnet"
            },
            "timeouts": null,
            "vpc_id": "vpc-035ed49b3d80ac227"
          },
          "sensitive_attributes": [],
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjo2MDAwMDAwMDAwMDAsImRlbGV0ZSI6MTIwMDAwMDAwMDAwMH0sInNjaGVtYV92ZXJzaW9uIjoiMSJ9",
          "dependencies": [
            "module.vpc.aws_vpc.ebslab_vpc",
            "module.vpc.data.aws_availability_zones.available"
          ]
        },
        {
          "index_key": 1,
          "schema_version": 1,
          "attributes": {
            "arn": "arn:aws:ec2:eu-west-1:884878220922:subnet/subnet-0055821a14ba6426e",
            "assign_ipv6_address_on_creation": false,
            "availability_zone": "eu-west-1b",
            "availability_zone_id": "euw1-az1",
            "cidr_block": "10.0.2.0/24",
            "customer_owned_ipv4_pool": "",
            "enable_dns64": false,
            "enable_resource_name_dns_a_record_on_launch": false,
            "enable_resource_name_dns_aaaa_record_on_launch": false,
            "id": "subnet-0055821a14ba6426e",
            "ipv6_cidr_block": "",
            "ipv6_cidr_block_association_id": "",
            "ipv6_native": false,
            "map_customer_owned_ip_on_launch": false,
            "map_public_ip_on_launch": true,
            "outpost_arn": "",
            "owner_id": "884878220922",
            "private_dns_hostname_type_on_launch": "ip-name",
            "tags": {
              "Name": "Public-Subnet"
            },
            "tags_all": {
              "Name": "Public-Subnet"
            },
            "timeouts": null,
            "vpc_id": "vpc-035ed49b3d80ac227"
          },
          "sensitive_attributes": [],
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjo2MDAwMDAwMDAwMDAsImRlbGV0ZSI6MTIwMDAwMDAwMDAwMH0sInNjaGVtYV92ZXJzaW9uIjoiMSJ9",
          "dependencies": [
            "module.vpc.aws_vpc.ebslab_vpc",
            "module.vpc.data.aws_availability_zones.available"
          ]
        },
        {
          "index_key": 2,
          "schema_version": 1,
          "attributes": {
            "arn": "arn:aws:ec2:eu-west-1:884878220922:subnet/subnet-0ea4e1fd7570b534d",
            "assign_ipv6_address_on_creation": false,
            "availability_zone": "eu-west-1c",
            "availability_zone_id": "euw1-az2",
            "cidr_block": "10.0.3.0/24",
            "customer_owned_ipv4_pool": "",
            "enable_dns64": false,
            "enable_resource_name_dns_a_record_on_launch": false,
            "enable_resource_name_dns_aaaa_record_on_launch": false,
            "id": "subnet-0ea4e1fd7570b534d",
            "ipv6_cidr_block": "",
            "ipv6_cidr_block_association_id": "",
            "ipv6_native": false,
            "map_customer_owned_ip_on_launch": false,
            "map_public_ip_on_launch": false,
            "outpost_arn": "",
            "owner_id": "884878220922",
            "private_dns_hostname_type_on_launch": "ip-name",
            "tags": {
              "Name": "Private-Subnet"
            },
            "tags_all": {
              "Name": "Private-Subnet"
            },
            "timeouts": null,
            "vpc_id": "vpc-035ed49b3d80ac227"
          },
          "sensitive_attributes": [],
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjo2MDAwMDAwMDAwMDAsImRlbGV0ZSI6MTIwMDAwMDAwMDAwMH0sInNjaGVtYV92ZXJzaW9uIjoiMSJ9",
          "dependencies": [
            "module.vpc.aws_vpc.ebslab_vpc",
            "module.vpc.data.aws_availability_zones.available"
          ]
        },
        {
          "index_key": 3,
          "schema_version": 1,
          "attributes": {
            "arn": "arn:aws:ec2:eu-west-1:884878220922:subnet/subnet-0014540d42edbfbd7",
            "assign_ipv6_address_on_creation": false,
            "availability_zone": "eu-west-1a",
            "availability_zone_id": "euw1-az3",
            "cidr_block": "10.0.4.0/24",
            "customer_owned_ipv4_pool": "",
            "enable_dns64": false,
            "enable_resource_name_dns_a_record_on_launch": false,
            "enable_resource_name_dns_aaaa_record_on_launch": false,
            "id": "subnet-0014540d42edbfbd7",
            "ipv6_cidr_block": "",
            "ipv6_cidr_block_association_id": "",
            "ipv6_native": false,
            "map_customer_owned_ip_on_launch": false,
            "map_public_ip_on_launch": false,
            "outpost_arn": "",
            "owner_id": "884878220922",
            "private_dns_hostname_type_on_launch": "ip-name",
            "tags": {
              "Name": "Private-Subnet"
            },
            "tags_all": {
              "Name": "Private-Subnet"
            },
            "timeouts": null,
            "vpc_id": "vpc-035ed49b3d80ac227"
          },
          "sensitive_attributes": [],
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjo2MDAwMDAwMDAwMDAsImRlbGV0ZSI6MTIwMDAwMDAwMDAwMH0sInNjaGVtYV92ZXJzaW9uIjoiMSJ9",
          "dependencies": [
            "module.vpc.aws_vpc.ebslab_vpc",
            "module.vpc.data.aws_availability_zones.available"
          ]
        }
      ]
    },
    {
      "module": "module.vpc",
      "mode": "managed",
      "type": "aws_vpc",
      "name": "ebslab_vpc",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 1,
          "attributes": {
            "arn": "arn:aws:ec2:eu-west-1:884878220922:vpc/vpc-035ed49b3d80ac227",
            "assign_generated_ipv6_cidr_block": false,
            "cidr_block": "10.0.0.0/16",
            "default_network_acl_id": "acl-076ff5af1ecb547a9",
            "default_route_table_id": "rtb-0310f0f71230a3234",
            "default_security_group_id": "sg-014ed8bf95dce5959",
            "dhcp_options_id": "dopt-034758b73da6235d6",
            "enable_classiclink": false,
            "enable_classiclink_dns_support": false,
            "enable_dns_hostnames": true,
            "enable_dns_support": true,
            "id": "vpc-035ed49b3d80ac227",
            "instance_tenancy": "default",
            "ipv4_ipam_pool_id": null,
            "ipv4_netmask_length": null,
            "ipv6_association_id": "",
            "ipv6_cidr_block": "",
            "ipv6_cidr_block_network_border_group": "",
            "ipv6_ipam_pool_id": "",
            "ipv6_netmask_length": 0,
            "main_route_table_id": "rtb-0310f0f71230a3234",
            "owner_id": "884878220922",
            "tags": {
              "Name": "ebs-lab"
            },
            "tags_all": {
              "Name": "ebs-lab"
            }
          },
          "sensitive_attributes": [],
          "private": "eyJzY2hlbWFfdmVyc2lvbiI6IjEifQ=="
        }
      ]
    },
    {
      "module": "module.vpc",
      "mode": "managed",
      "type": "random_shuffle",
      "name": "az_list",
      "provider": "provider[\"registry.terraform.io/hashicorp/random\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "id": "-",
            "input": [
              "eu-west-1a",
              "eu-west-1b",
              "eu-west-1c"
            ],
            "keepers": null,
            "result": [
              "eu-west-1a",
              "eu-west-1c"
            ],
            "result_count": 2,
            "seed": null
          },
          "sensitive_attributes": [],
          "private": "bnVsbA==",
          "dependencies": [
            "module.vpc.data.aws_availability_zones.available"
          ]
        }
      ]
    }
  ]
}
