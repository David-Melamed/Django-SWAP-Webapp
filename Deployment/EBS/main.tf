# modules/vpc/main.tf
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
  security_group_id       = module.vpc.security_group_id
}

# modules/iam_role/main.tf
module "ebs_role" {
  source                  = "./modules/iam_role"
  role_name               = "ebslab-role"
  assume_role_policy_file = "./modules/iam_role/json/iam_role_policy.json"
  assume_policy_file      = "./modules/iam_role/json/iam_policy.json"
}

# modules/beanstalk/main.tf
module "beanstalk" {
  source                  = "./modules/beanstalk"
  ebs_app_name            = "swap-webapp"
  ebs_app_description     = "Python Web App Application using Django Framework" 
  env                     = "dev"
  service_role_name       = "aws-elasticbeanstalk-ec2-role"
  service_role_arn        = module.ebs_role.role_arn
  vpc_id                  = module.vpc.vpc_id
  subnet_ids              = module.vpc.subnet_ids
  instance_type           = "t2.micro"
  keypair                 = "DavidKeyPair"
  security_group_id       = module.vpc.security_group_id
}