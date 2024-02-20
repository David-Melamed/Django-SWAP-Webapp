variable "vpc_cidr" {}
variable "access_ip" {}
variable "public_sn_count" {}
variable "instance_tenancy" {}
variable "tags" {}
variable "map_public_ip_on_launch" {}
variable "rt_route_cidr_block" {}
variable "vpc_id" {}

variable "public_cidrs" {
  type = list(any)
}

variable "subnet_ids" {
  type = list(string)
}

