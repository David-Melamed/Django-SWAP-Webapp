locals {
  assume_role_policy = jsondecode(file(var.assume_role_policy_file))
}

resource "aws_iam_role" "ebslab_role" {
  name = var.role_name
  assume_role_policy = jsonencode(local.assume_role_policy)
}