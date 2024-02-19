output "aws_public_subnet" {
  value = aws_subnet.public_ebslab_subnet.*.id
}

output "vpc_id" {
  value = aws_vpc.ebslab_vpc.id
}
