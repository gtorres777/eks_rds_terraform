variable "cluster-name" {
  type    = string
  default = "eks_cluster"
}

variable "private_subnets_eks_ids" {
  type        = list(string)
  description = "CIDR block for EKS Private Subnet"
}

variable "vpc_id" {
  type    = string
  description = "main vpc id "
}

variable "private_subnets_rds_cidr" {
  type        = list(any)
  description = "CIDR block for RDS Private Subnet"
  default     = ["10.0.3.0/24","10.0.4.0/24"]
}
