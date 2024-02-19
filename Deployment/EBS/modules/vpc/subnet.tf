resource "aws_subnet" "public_ebslab_subnet" {
  count                   = var.public_sn_count
  vpc_id                  = aws_vpc.ebslab_vpc.id
  cidr_block              = var.public_cidrs[count.index]
  availability_zone       = random_shuffle.az_list.result[count.index]
  map_public_ip_on_launch = var.map_public_ip_on_launch
  tags = {
    Name = var.tags
  }
}

data "aws_availability_zones" "available" {
}

resource "random_shuffle" "az_list" {
  input        = data.aws_availability_zones.available.names
  result_count = 2
}