# Create a new load balancer
resource "aws_lb" "front_end" {
  name                 = format("%s-%s", var.ebs_app_name, var.env)
  security_groups      = var.security_group_id
  subnets              = var.subnet_ids

  tags = {
    Environment = "dev"
  }
}

resource "aws_lb_target_group" "fronted_tg" {
  name        = format("%s-%s-%s", var.ebs_app_name, var.env, "tg")
  target_type = "instance"
  port        = 443
  protocol    = "HTTPS"
  vpc_id      = var.vpc_id

  health_check {
    enabled             = true
    interval            = 30
    path                = "/health"
    port                = "80"
    protocol            = "HTTP"  
    healthy_threshold   = 3
    unhealthy_threshold = 3
    timeout             = 5
    matcher             = "200"
  }
}

resource "aws_lb_listener" "https_listener" {
    load_balancer_arn = aws_lb.front_end.arn
    port              = "443"
    protocol          = "HTTPS"
    ssl_policy        = "ELBSecurityPolicy-2016-08"
    certificate_arn = var.ssl_certificate_arn

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.fronted_tg.arn
    }
}

resource "aws_lb_listener_certificate" "example" {
    listener_arn    = aws_lb_listener.https_listener.arn
    certificate_arn = var.ssl_certificate_arn
}

data "aws_instances" "eb_env_instances" {
    instance_tags = {
        "elasticbeanstalk:environment-name" = format("%s-%s", var.ebs_app_name, var.env)
  }
}

resource "aws_lb_target_group_attachment" "test" {
    for_each = toset(data.aws_instances.eb_env_instances.ids)
    target_group_arn = aws_lb_target_group.fronted_tg.arn
    target_id        = each.value.id
    port             = 80
}