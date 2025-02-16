resource "aws_db_subnet_group" "order_product_subnet_group" {
  name       = "${var.db_order_product_instance_name}-subnet-group"
  subnet_ids = var.subnets_ids

  tags = {
    Name = "${var.db_order_product_instance_name}-subnet-group"
  }
}

resource "aws_db_subnet_group" "payments_subnet_group" {
  name       = "${var.db_payments_instance_name}-subnet-group"
  subnet_ids = var.subnets_ids

  tags = {
    Name = "${var.db_payments_instance_name}-subnet-group"
  }
}

resource "aws_db_instance" "db-order-product" {
  allocated_storage      = var.db_order_product_allocated_storage
  instance_class         = var.db_order_product_instance_class
  engine                 = "mysql"
  engine_version         = var.db_order_product_version # Specify desired MySQL version
  identifier             = var.db_order_product_instance_name
  username               = var.db_order_product_username
  password               = var.db_order_product_password
  skip_final_snapshot    = true
  db_subnet_group_name   = aws_db_subnet_group.order_product_subnet_group.name
  vpc_security_group_ids = [aws_security_group.db_order_product_sg.id]

  tags = {
    Name = var.db_order_product_instance_name
  }
}

resource "aws_db_instance" "db-payments" {
  allocated_storage      = var.db_payments_allocated_storage
  instance_class         = var.db_payments_instance_class
  engine                 = "mysql"
  engine_version         = var.db_payments_version # Specify desired MySQL version
  identifier             = var.db_payments_instance_name
  username               = var.db_payments_username
  password               = var.db_payments_password
  skip_final_snapshot    = true
  db_subnet_group_name   = aws_db_subnet_group.payments_subnet_group.name
  vpc_security_group_ids = [aws_security_group.db_payments_sg.id]

  tags = {
    Name = var.db_payments_instance_name
  }
}