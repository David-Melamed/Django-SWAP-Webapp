output "ebs_address" {
  value = aws_route53_record.ebs-ns.name
}

output "ebs_url" {
  value = var.ebs_record_name
}

output "ebs-cert-validation" {
  value = aws_route53_record.ebs-ns.fqdn
}