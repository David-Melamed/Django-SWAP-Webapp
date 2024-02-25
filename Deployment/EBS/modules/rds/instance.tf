resource "aws_db_instance" "mysql_db" {
  allocated_storage = var.allocated_storage
  engine = var.engine
  engine_version = var.engine_version
  instance_class = var.instance_class
  username = var.username
  password = var.password
  db_name = var.db_name
  skip_final_snapshot = var.skip_final_snapshot
  vpc_security_group_ids = var.vpc_security_group_id
  db_subnet_group_name = aws_db_subnet_group.db_subnet_group.name

}

resource "aws_db_subnet_group" "db_subnet_group" {
  name = var.subnet_name
  subnet_ids = var.subnet_ids

  tags = {
    Name = "MySQL DB Subnet Group"
  }
}