resource "aws_route53_record" "ebs-ns" {
  zone_id = var.zone_id
  name    = var.ebs_record_name
  type    = "CNAME"
  ttl     = "15"
  records = ["${var.ebs_address}"] 
}

