resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
}

data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_subnet" "main" {
  for_each          = toset(var.subnets_cidr)
  availability_zone = element(data.aws_availability_zones.available.names, index(var.subnets_cidr, each.key))
  cidr_block        = cidrsubnet(aws_vpc.main.cidr_block, 8, index(var.subnets_cidr, each.key))
  vpc_id            = aws_vpc.main.id
}

resource "aws_route_table" "main" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
}

resource "aws_route_table_association" "subnet" {
  for_each       = aws_subnet.main
  subnet_id      = each.value.id
  route_table_id = aws_route_table.main.id
}
