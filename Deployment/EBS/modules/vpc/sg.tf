# Create a security group
resource "aws_security_group" "ebslab_security_group" {
  name        = var.sg_name
  description = "Security group for Elastic Beanstalk"

  vpc_id      = aws_vpc.ebslab_vpc.id
}

resource "aws_security_group_rule" "ebslab_security_group_rule_8080" {
  security_group_id = aws_security_group.ebslab_security_group.id
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
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
