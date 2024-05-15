resource "aws_acm_certificate" "cert" {
  domain_name       = var.acm_domain_name
  validation_method = "DNS"
  
  tags = {
    Name = "EBS Lab ACM Certificate"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_acm_certificate_validation" "default" {
  certificate_arn         = aws_acm_certificate.cert.arn
  validation_record_fqdns = [var.cert-validations]
}
