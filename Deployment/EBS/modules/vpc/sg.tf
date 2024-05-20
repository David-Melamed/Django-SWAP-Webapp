# Create a security group
resource "aws_security_group" "ebslab_security_group" {
  name        = var.sg_name
  description = "Security group for Elastic Beanstalk"

  vpc_id      = aws_vpc.ebslab_vpc.id
}

resource "aws_security_group_rule" "ebslab_security_group_rule_80" {
  security_group_id = aws_security_group.ebslab_security_group.id
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]  # Allow traffic from any IP address
}

resource "aws_security_group_rule" "ebslab_security_group_rule_9090" {
  security_group_id = aws_security_group.ebslab_security_group.id
  type              = "ingress"
  from_port         = 9090
  to_port           = 9090
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]  # Allow traffic from any IP address
}

resource "aws_security_group_rule" "ebslab_security_group_rule_ssh" {
  security_group_id = aws_security_group.ebslab_security_group.id
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]  # Allow SSH from any IP address
}

resource "aws_security_group_rule" "ebslab_security_group_rule_ssl" {
  security_group_id = aws_security_group.ebslab_security_group.id
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]  # Allow secure connection from any IP address
}

resource "aws_security_group_rule" "internal_mysql_communication" {
  security_group_id = aws_security_group.ebslab_security_group.id
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  source_security_group_id = aws_security_group.ebslab_security_group.id
}