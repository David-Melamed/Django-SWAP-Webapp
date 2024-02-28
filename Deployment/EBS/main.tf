
module "vpc" {
  source                  = "./modules/vpc"
  tags                    = "ebs-lab"
  instance_tenancy        = "default"
  vpc_cidr                = "10.0.0.0/16"
  access_ip               = "0.0.0.0/0"
  public_sn_count         = 2
  public_cidrs            = ["10.0.1.0/24", "10.0.2.0/24"]
  map_public_ip_on_launch = true
  rt_route_cidr_block     = "0.0.0.0/0"
  vpc_id                  = module.vpc.vpc_id
  subnet_ids              = module.vpc.subnet_ids
  sg_name                 = "ebslab-sg"
  security_group_id       = module.vpc.security_group_id
  enable_dns_hostnames    = true
}

module "ebs_role" {
  source                  = "./modules/iam_role"
  role_name               = "ebslab-role"
  assume_role_policy_file = "./modules/iam_role/json/iam_role_policy.json"
  assume_policy_file      = "./modules/iam_role/json/iam_policy.json"
}

module "rds" {
  source                  = "./modules/rds"
  allocated_storage       = 10
  engine                  = "mysql"
  engine_version          = 5.7
  instance_class          = "db.t3.micro"
  username                = "root"
  password                = "password"
  db_name                 = "my_application"
  skip_final_snapshot     = true
  subnet_name             = module.vpc.sg_name
  subnet_ids              = module.vpc.subnet_ids
  vpc_security_group_id   = module.vpc.security_group_id
  vpc_id                  = module.vpc.vpc_id
  zone_name               = join("-", ["ebs-lab", "mysql"])
  instance_private_ips    = module.beanstalk.instance_private_ips
  record_name             = module.beanstalk.env
  }

module "beanstalk" {
  source                  = "./modules/beanstalk"
  ebs_app_name            = "swap-webapp"
  ebs_app_description     = "Python Web App Application using Django Framework" 
  env                     = "dev"
  service_role_name       = "aws-elasticbeanstalk-ec2-role"
  service_role_arn        = module.ebs_role.role_arn
  vpc_id                  = module.vpc.vpc_id
  subnet_ids              = module.vpc.subnet_ids
  instance_type           = "t3.small"
  keypair                 = "DavidKeyPair"
  security_group_id       = module.vpc.security_group_id
  bucket_name             = join("-", [module.beanstalk.ebs_app_name, "bucket"])
  application_version     = "v1.59.9.7"
  instance_private_ips    = module.beanstalk.instance_private_ips
  cname_prefix            = module.beanstalk.beanstalk_cname_prefix
}
