resource "aws_vpc" "k8s_vpc" {
  cidr_block = var.vpc_cidr_block
  tags       = {
    Name      = var.vpc_name
    Terraform = true
  }
}

resource "aws_subnet" "k8s_subnet" {
  cidr_block = "10.1.0.0/24"
  vpc_id            = aws_vpc.k8s_vpc.id
  availability_zone = var.availability_zone_name

  tags = {
    Name      = "K8sSubnet"
    Terraform = true
  }
}

resource "aws_internet_gateway" "k8s_gw" {
  vpc_id = aws_vpc.k8s_vpc.id

  tags = {
    Name = var.vpc_name
    Terraform = true
  }
}

resource "aws_route_table" "k8s_route_table" {
  vpc_id = aws_vpc.k8s_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.k8s_gw.id
  }

  tags = {
    Terraform = true
  }
}

resource "aws_route_table_association" "k8s_association" {
  subnet_id      = aws_subnet.k8s_subnet.id
  route_table_id = aws_route_table.k8s_route_table.id
}
