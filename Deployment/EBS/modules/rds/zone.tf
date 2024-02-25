resource "aws_route53_zone" "private_rds" {
  name = var.zone_name

  vpc {
    vpc_id = var.vpc_id
  }
}

resource "aws_route53_record" "rds-ns" {
  zone_id = aws_route53_zone.private_rds.zone_id
  name    = var.record_name
  type    = "NS"
  ttl     = "30"
  records = var.instance_private_ips
}