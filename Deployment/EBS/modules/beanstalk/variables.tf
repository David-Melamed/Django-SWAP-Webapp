variable "ebs_app_name" {}
variable "ebs_app_description" {}
variable "env" {}
variable "vpc_id" {}
variable "service_role_name" {}
variable "service_role_arn" {}
variable "instance_type" {}
variable "bucket_name" {}
variable "security_group_id" {}
variable "application_version" {}
variable "cname_prefix" {}
variable instance_private_ips {
  type = list(any)
}
variable "subnet_ids" {
  type = list(string)
}

variable "ebs_environment_url" {}
variable "ssl_certificate_arn" {}
variable "solution_stack_name" {}
variable "subnet_availability_zones" {}
variable "path_to_ssh_public_key" {
  description = "The path to the SSH public key"
  default     = "~/.ssh/id_rsa.pub"
}
variable "zone_id" {}
variable "zone_name" {}