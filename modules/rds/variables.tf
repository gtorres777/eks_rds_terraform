variable "vpc_id" {
  type    = string
  description = "vpc id that contains the RDS instance"
}

variable "allocated_storage" {
  type        = number
  description = "size of the EBS storage attached to the RDS instance"
  default     = 20
}

variable "identifier" {
  type    = string
  description = "identifier for the RDS instance"
  default = "postgres-rds"
}

variable "storage_type" {
  type    = string
  description = "storage type for the RDS instance"
  default = "gp2"
}

variable "engine" {
  type    = string
  description = "type of db engine for the RDS instance"
  default = "postgres"
}

variable "engine_version" {
  type    = string
  description = "version for the engine chose for the RDS instance"
  default = "14.1"
}

variable "instance_class" {
  type    = string
  description = "instance class for the RDS instance"
  default = "db.t3.micro"
}

variable "port" {
  type    = number
  description = "port for the RDS instance"
  default = 5432
}

variable "username" {
  type    = string
  description = "admin username to access the RDS instance"
  default = "postgres"
}

variable "password" {
  type    = string
  description = "admin password to access the RDS instance"
  default = "mysecretpassword"
}

variable "db_subnet_group_name" {
  type    = string
  description = "subnet group id of the private subnets that contain the RDS instance"
}

variable "publicly_accessible" {
  description = "parameter to make public or not the RDS instance"
  default = false
}

variable "skip_final_snapshot" {
  description = "parameter to skip final snapshot or not from the RDS instance"
  default = true
}

variable "private_subnets_eks_cidr" {
  type        = list(any)
  description = "CIDR block for EKS Private Subnet"
  default     = ["10.0.1.0/24","10.0.2.0/24"]
}

