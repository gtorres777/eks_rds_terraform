variable "aws_eks_cluster_name" {
  type    = string
}

variable "private_subnets_eks_ids" {
  type        = list(string)
  description = "CIDR block for EKS Private Subnet"
}

variable "disk_size" {
  type    = number
  default = 10
}

variable "instance_types" {
  type    = list(string)
  default = ["t3.medium"]
}

variable "desired_size" {
  type    = number
  default = 2
}

variable "max_size" {
  type    = number
  default = 4
}

variable "min_size" {
  type    = number
  default = 2
}
