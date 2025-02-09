resource "aws_db_subnet_group" "default" {
  name       = "${var.db_instance_name}-subnet-group"
  subnet_ids = var.subnets_ids

  tags = {
    Name = "${var.db_instance_name}-subnet-group"
  }
}

resource "aws_db_instance" "db" {
  allocated_storage      = var.db_allocated_storage
  instance_class         = var.db_instance_class
  engine                 = "mysql"
  engine_version         = var.db_version # Specify desired MySQL version
  identifier             = var.db_instance_name
  username               = var.db_username
  password               = var.db_password
  skip_final_snapshot    = true
  db_subnet_group_name   = aws_db_subnet_group.default.name
  vpc_security_group_ids = [aws_security_group.db_sg.id]

  tags = {
    Name = var.db_instance_name
  }
}
