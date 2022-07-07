resource "aws_vpc" "main_vpc" {
  cidr_block = var.vpc_cidr

  tags = tomap({
    "Name"                                      = "main_vpc",
    "kubernetes.io/cluster/${var.cluster-name}" = "shared",
  })
}

