resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "${var.prefix}-vpc"
  }
}

resource "aws_subnet" "subnets" {
  count             = var.subnet_count
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.${count.index}.0/24"
  availability_zone = data.aws_availability_zones.available.names[count.index]

  map_public_ip_on_launch = true

  tags = {
    Name = "${var.prefix}-subnet-${count.index}"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.prefix}-igw"
  }
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.prefix}-rt"
  }
}

resource "aws_route_table_association" "rt-assiciation" {
  count          = var.subnet_count
  subnet_id      = aws_subnet.subnets.*.id[count.index]
  route_table_id = aws_route_table.rt.id
}

resource "aws_security_group" "ssh_cluster" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    name = "${var.prefix}-sg"
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

resource "aws_eks_cluster" "eks-cluster" {
  name     = "${var.prefix}-${var.cluster_name}"
  role_arn = data.aws_iam_role.labrole.arn

  access_config {
    authentication_mode = var.authentication_mode
  }

  vpc_config {
    subnet_ids         = aws_subnet.subnets[*].id
    security_group_ids = [aws_security_group.ssh_cluster.id]
  }
}

resource "aws_eks_node_group" "node-group" {
  cluster_name    = aws_eks_cluster.eks-cluster.name
  node_group_name = "${var.prefix}-ng"
  node_role_arn   = data.aws_iam_role.labrole.arn
  subnet_ids      = aws_subnet.subnets[*].id
  instance_types  = ["t3.medium"]

  scaling_config {
    desired_size = 1
    max_size     = 3
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }
}

resource "aws_eks_access_policy_association" "eks-policy" {
  cluster_name  = aws_eks_cluster.eks-cluster.name
  policy_arn    = var.policy_arn
  principal_arn = var.principal_arn

  access_scope {
    type = "cluster"
  }
}

resource "aws_eks_access_entry" "access-entry" {
  cluster_name      = aws_eks_cluster.eks-cluster.name
  principal_arn     = var.principal_arn
  kubernetes_groups = ["8soat"]
  type              = "STANDARD"
}

resource "aws_ecr_repository" "repository" {
  name = var.prefix
}
