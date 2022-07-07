locals {
  availability_zones = ["${var.aws_region}a", "${var.aws_region}b"]
}

module "vpc_networking" {
  source = "./modules/vpc_networking"

  availability_zones = local.availability_zones
}

module "eks_cluster" {
  source = "./modules/eks_cluster"

  private_subnets_eks_ids = module.vpc_networking.private_subnets_eks_ids
  vpc_id                  = module.vpc_networking.vpc_id

}

module "eks_worker_nodes" {
  source = "./modules/eks_worker_nodes"

  aws_eks_cluster_name    = module.eks_cluster.aws_eks_cluster_name
  private_subnets_eks_ids = module.vpc_networking.private_subnets_eks_ids
}


module "rds" {
  source = "./modules/rds"

  vpc_id               = module.vpc_networking.vpc_id
  db_subnet_group_name = module.vpc_networking.aws_rds_subnet_group_id
}

