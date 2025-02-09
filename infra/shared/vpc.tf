data "aws_availability_zones" "available" {}

resource "aws_vpc" "totem_express_vpc" {
  cidr_block = var.vpc_cidr # Use the variable for the CIDR block
}

resource "aws_subnet" "totem_express_subnets" {
  count             = 2 # Create multiple subnets for high availability
  vpc_id            = aws_vpc.totem_express_vpc.id
  cidr_block        = cidrsubnet(aws_vpc.totem_express_vpc.cidr_block, 2, count.index)
  availability_zone = data.aws_availability_zones.available.names[count.index]

  map_public_ip_on_launch                     = true
  enable_resource_name_dns_a_record_on_launch = true

  tags = {
    Application = "totem-express"
    Name        = "totem-express-subnet-${count.index}"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.totem_express_vpc.id

  tags = {
    Name = "totem-express-igw"
  }
}

resource "aws_route_table" "public_routetable" {
  vpc_id = aws_vpc.totem_express_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "totem-express-public-rt"
  }
}

resource "aws_route_table_association" "public_rt_association" {
  count = length(aws_subnet.totem_express_subnets)

  subnet_id      = aws_subnet.totem_express_subnets.*.id[count.index]
  route_table_id = aws_route_table.public_routetable.id
}

resource "aws_security_group" "ssh_cluster" {
  vpc_id = aws_vpc.totem_express_vpc.id

  tags = {
    name = "totem-express-ssh-sg"
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}