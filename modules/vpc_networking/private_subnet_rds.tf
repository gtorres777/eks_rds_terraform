resource "aws_subnet" "private_subnets_rds" {
  count                   = length(var.private_subnets_rds_cidr)
  availability_zone       = element(var.availability_zones, count.index)
  cidr_block              = element(var.private_subnets_rds_cidr, count.index)
  map_public_ip_on_launch = false
  vpc_id                  = aws_vpc.main_vpc.id

  tags = {
    Name = "private_subnets_rds_${count.index}"
  }

}

resource "aws_db_subnet_group" "rds_subnet_group" {
  name        = "rds_subnet_group"
  subnet_ids  = aws_subnet.private_subnets_rds.*.id

  depends_on = [
    aws_subnet.private_subnets_rds
  ]

}

resource "aws_route_table" "private_rds_rt" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "private_rds_rt"
  }

}

resource "aws_route_table_association" "private_rds_rta" {
  count          = length(var.private_subnets_rds_cidr)
  subnet_id      = aws_subnet.private_subnets_rds.*.id[count.index]
  route_table_id = aws_route_table.private_rds_rt.id
}
