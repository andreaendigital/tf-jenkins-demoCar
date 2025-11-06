# Define input variables for VPC configuration
variable "vpc_cidr" {}
variable "vpc_name" {}
variable "cidr_public_subnet" {}
variable "eu_availability_zone" {}
variable "cidr_private_subnet" {}

# Output VPC and subnet metadata for reuse in other modules
output "demoCar_1_vpc_id" {
  value = aws_vpc.demoCar_1_vpc_us_east_1.id
}

output "demoCar_1_public_subnets" {
  value = aws_subnet.demoCar_1_public_subnets.*.id
}

output "public_subnet_cidr_block" {
  value = aws_subnet.demoCar_1_public_subnets.*.cidr_block
}


# Setup VPC with the specified CIDR block
resource "aws_vpc" "demoCar_1_vpc_us_east_1" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = var.vpc_name
  }
}


# Setup public subnet
resource "aws_subnet" "demoCar_1_public_subnets" {
  count             = length(var.cidr_public_subnet)
  vpc_id            = aws_vpc.demoCar_1_vpc_us_east_1.id
  cidr_block        = element(var.cidr_public_subnet, count.index)
  availability_zone = element(var.eu_availability_zone, count.index)

  tags = {
    Name = "demoCar-public-subnet-${count.index + 1}"
  }
}


# Setup private subnet
resource "aws_subnet" "demoCar_1_private_subnets" {
  count             = length(var.cidr_private_subnet)
  vpc_id            = aws_vpc.demoCar_1_vpc_us_east_1.id
  cidr_block        = element(var.cidr_private_subnet, count.index)
  availability_zone = element(var.eu_availability_zone, count.index)

  tags = {
    Name = "demoCar-private-subnet-${count.index + 1}"
  }
}


# Setup Internet Gateway for public subnets
resource "aws_internet_gateway" "demoCar_1_public_internet_gateway" {
  vpc_id = aws_vpc.demoCar_1_vpc_us_east_1.id
  tags = {
    Name = "demoCar-1-igw"
  }
}


# Public Route Table for public subnets with default route to IGW
resource "aws_route_table" "demoCar_1_public_route_table" {
  vpc_id = aws_vpc.demoCar_1_vpc_us_east_1.id
  route {
    cidr_block = "0.0.0.0/0"              # Default route to internet
    gateway_id = aws_internet_gateway.demoCar_1_public_internet_gateway.id
  }
  tags = {
    Name = "demoCar-1-public-rt"
  }
}


# Public Route Table and Public Subnet Association
resource "aws_route_table_association" "demoCar_1_public_rt_subnet_association" {
  count          = length(aws_subnet.demoCar_1_public_subnets)
  subnet_id      = aws_subnet.demoCar_1_public_subnets[count.index].id
  route_table_id = aws_route_table.demoCar_1_public_route_table.id
}

# Private Route Table
resource "aws_route_table" "demoCar_1_private_subnets" {
  vpc_id = aws_vpc.demoCar_1_vpc_us_east_1.id
  #depends_on = [aws_nat_gateway.nat_gateway]
  tags = {
    Name = "demoCar-1-private-rt"
  }
}

# Private Route Table and private Subnet Association
resource "aws_route_table_association" "demoCar_1_private_rt_subnet_association" {
  count          = length(aws_subnet.demoCar_1_private_subnets)
  subnet_id      = aws_subnet.demoCar_1_private_subnets[count.index].id
  route_table_id = aws_route_table.demoCar_1_private_subnets.id
}
