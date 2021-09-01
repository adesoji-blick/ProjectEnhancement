# VPC, Subnets, IGW, Routing Table & Subnet Association Creation #

# VPC Creation #
resource "aws_vpc" "app_vpc" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = var.vpc_name
  }
}

# Subnet Creation #
resource "aws_subnet" "app_vpc_subnet" {
  count                   = var.network_instance_count
  vpc_id                  = aws_vpc.app_vpc.id
  cidr_block              = var.subnet_cidr_block[count.index]
  availability_zone       = var.availability_zone[count.index]
  map_public_ip_on_launch = var.map_public_ip

  tags = {
    # Name = "app_vpc_subnet"
    Name = "app_vpc_subnet_${count.index + 1}"
  }
}

# Internet Gateway Creation # 
resource "aws_internet_gateway" "app_vpc_igw" {
  vpc_id = aws_vpc.app_vpc.id

  tags = {
    Name = "app_vpc_igw"
  }
}

# Route Table Creation # 
resource "aws_route_table" "app_vpc_rt" {
  vpc_id = aws_vpc.app_vpc.id
  route {
    cidr_block = var.rt_cidr_block
    gateway_id = aws_internet_gateway.app_vpc_igw.id
  }

  tags = {
    Name = "app_vpc_rt"
  }
}

# Route Table Association # 
resource "aws_route_table_association" "app_vpc_rt" {
  count          = var.network_instance_count
  subnet_id      = aws_subnet.app_vpc_subnet[count.index].id
  route_table_id = aws_route_table.app_vpc_rt.id
}
