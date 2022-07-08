resource "aws_subnet" "private_subnets_eks" {
  count                   = length(var.private_subnets_eks_cidr)
  availability_zone       = element(var.availability_zones, count.index)
  cidr_block              = element(var.private_subnets_eks_cidr, count.index)
  map_public_ip_on_launch = false
  vpc_id                  = aws_vpc.main_vpc.id

  tags = tomap({
    "Name"                                      = "private_subnet_eks_${count.index}",
    "kubernetes.io/cluster/${var.cluster-name}" = "shared",
  })
}

resource "aws_route_table" "private_eks_rt" {
  vpc_id = aws_vpc.main_vpc.id
  count  = 1

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gws.*.id[count.index]
  }

  tags = {
    Name = "private_eks_rt"
  }
}

resource "aws_route_table_association" "private_eks_rta" {
  count          = length(var.private_subnets_eks_cidr)
  subnet_id      = aws_subnet.private_subnets_eks.*.id[count.index]
  route_table_id = aws_route_table.private_eks_rt.*.id[0]
}


