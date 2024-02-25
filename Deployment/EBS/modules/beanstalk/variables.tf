variable "ebs_app_name" {}
variable "ebs_app_description" {}
variable "env" {}
variable "vpc_id" {}
variable "service_role_name" {}
variable "service_role_arn" {}
variable "instance_type" {}
variable "keypair" {}
variable "bucket_name" {}
variable "security_group_id" {}
variable "application_version" {}
variable instance_private_ips {
  type = list(any)
}
variable "subnet_ids" {
  type = list(string)
}