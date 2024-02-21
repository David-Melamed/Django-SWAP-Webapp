locals {
  assume_ebs_role_policy = jsondecode(file(var.assume_role_policy_file))
  assume_ebs_policy = jsondecode(file(var.assume_policy_file))
}

resource "aws_iam_role" "ebslab_role" {
  name = var.role_name
  assume_role_policy = jsonencode(local.assume_ebs_role_policy)
}

resource "aws_iam_policy" "awseb_full_access" {
  name        = "AWSElasticBeanstalkFullAccess"
  description = "Provides full access to AWS Elastic Beanstalk"
  policy = jsonencode(local.assume_ebs_policy)
}

# Attach AWS Elastic Beanstalk policy
resource "aws_iam_role_policy_attachment" "ebslab_beanstalk_policy_attachment" {
  policy_arn = "arn:aws:iam::aws:policy/AWSElasticBeanstalkFullAccess"
  role       = aws_iam_role.ebslab_role.name
}

# Attach AWS EC2 policy
resource "aws_iam_role_policy_attachment" "ebslab_ec2_policy_attachment" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
  role       = aws_iam_role.ebslab_role.name
}