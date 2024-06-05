locals {
  asg_name = [for setting in var.ebs_all_settings : setting.value if setting.namespace == "aws:autoscaling:launchconfiguration" && setting.option_name == "ManagedActionsEnabled"][0]
}

data "aws_autoscaling_group" "asg" {
  name = local.asg_name
}

data "aws_instances" "instances" {
  filter {
    name   = "tag:aws:autoscaling:groupName"
    values = [data.aws_autoscaling_group.asg.name]
  }
}

output "instance_public_ips" {
  value = data.aws_instances.instances.public_ips
}


