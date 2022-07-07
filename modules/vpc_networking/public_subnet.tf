resource "aws_subnet" "public_subnet_1" {
  count                   = length(var.public_subnets_cidr)
  availability_zone       = element(var.availability_zones, count.index)
  cidr_block              = element(var.public_subnets_cidr, count.index)
  map_public_ip_on_launch = true
  vpc_id                  = aws_vpc.main_vpc.id

  tags = {
    Name = "public_subnet_1"
  }
}

resource "aws_internet_gateway" "main_igw" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "main_igw"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main_igw.id
  }

  tags = {
    Name = "public_rt"
  }
}

resource "aws_route_table_association" "public_subnet_1_rta" {
  count          = length(var.public_subnets_cidr)
  subnet_id      = aws_subnet.public_subnet_1.*.id[count.index]
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_eip" "nat_eip" {
  vpc        = true
  depends_on = [aws_internet_gateway.main_igw]
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  count         = length(var.public_subnets_cidr)
  subnet_id     = aws_subnet.public_subnet_1.*.id[count.index]

  tags = {
    Name        = "nat"
  }

  depends_on = [aws_internet_gateway.main_igw]
}
