resource "aws_security_group" "db_order_product_sg" {
  name        = "${var.db_order_product_instance_name}-sg"
  description = "Allow access to RDS instance"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.db_order_product_instance_name}-sg"
  }
}

resource "aws_security_group" "db_payments_sg" {
  name        = "${var.db_payments_instance_name}-sg"
  description = "Allow access to RDS instance"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.db_payments_instance_name}-sg"
  }
}
