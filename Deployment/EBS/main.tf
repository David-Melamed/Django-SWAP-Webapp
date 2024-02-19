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
}

module "ebs" {
  source                  = "./modules/ebs"
  ebs_app_name            = "swap-webapp-dev"
  ebs_app_description     = "Python Web App Application using Django Framework" 
  env                     = "dev"
}