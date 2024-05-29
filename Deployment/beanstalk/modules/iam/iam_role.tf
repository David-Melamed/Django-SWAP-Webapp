locals {
  assume_ebs_role_policy = jsondecode(file(var.assume_role_policy_file))
  assume_ebs_policy = jsondecode(file(var.assume_policy_file))
  assume_ebs_ec2_role = jsondecode(file(var.assume_ebs_ec2_file))
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
  policy_arn = aws_iam_policy.awseb_full_access.arn
  role       = aws_iam_role.ebslab_role.name
}

# Attach AWS EC2 policy
resource "aws_iam_role_policy_attachment" "ebslab_ec2_policy_attachment" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
  role       = aws_iam_role.ebslab_role.name
}


resource "aws_iam_role" "beanstalk_ec2_role" {
  name = "aws-elasticbeanstalk-ec2-role"
  assume_role_policy = jsonencode(local.assume_ebs_ec2_role)
}

resource "aws_iam_role_policy_attachment" "beanstalk_web_tier" {
  role       = aws_iam_role.beanstalk_ec2_role.name
  policy_arn = "arn:aws:iam::aws:policy/AWSElasticBeanstalkWebTier"
}

resource "aws_iam_role_policy_attachment" "beanstalk_worker_tier" {
  role       = aws_iam_role.beanstalk_ec2_role.name
  policy_arn = "arn:aws:iam::aws:policy/AWSElasticBeanstalkWorkerTier"
}

resource "aws_iam_role_policy_attachment" "beanstalk_multicontainer_docker" {
  role       = aws_iam_role.beanstalk_ec2_role.name
  policy_arn = "arn:aws:iam::aws:policy/AWSElasticBeanstalkMulticontainerDocker"
}