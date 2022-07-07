resource "aws_db_instance" "rds_instance" {
  allocated_storage      = var.allocated_storage
  identifier             = var.identifier
  storage_type           = var.storage_type
  engine                 = var.engine
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  port                   = var.port
  username               = var.username
  password               = var.password
  db_subnet_group_name   = var.db_subnet_group_name
  publicly_accessible    = var.publicly_accessible
  skip_final_snapshot    = var.skip_final_snapshot
  vpc_security_group_ids = ["${aws_security_group.rds_sg.id}"]

}

resource "aws_security_group" "rds_sg" {
  name = "rds_sg"
  vpc_id      = var.vpc_id

  # Only Postgres in
  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = var.private_subnets_eks_cidr
  }

  # Allow all outbound traffic.
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
