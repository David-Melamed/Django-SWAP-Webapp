output "ebs_address" {
  value = aws_route53_record.ebs-ns.name
}

output "ebs_url" {
  value = var.ebs_record_name
}

output "domain_validation_options" {
  value = aws_route53_record.ebs-ns
}

output "ebs_record_name" {
  value = var.ebs_record_name
}