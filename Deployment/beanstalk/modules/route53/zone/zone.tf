resource "aws_route53_zone" "ebs-lab" {
  name = var.zone_name
    
  tags = {
    Environment = "dev"
  }
}