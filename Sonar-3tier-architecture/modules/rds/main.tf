locals {
  required_tags = {
    project     = var.project_name,
    environment = var.environment,
  }
}

# # DB - RDS Instance
# resource "aws_rds_cluster" "cluster" {
#   engine                  = var.engine_name
#   engine_version          = var.engine_version
#   cluster_identifier      = var.project_name
#   master_username         = var.database_username
#   master_password         = var.database_password
#   allocated_storage       = 100
#   db_subnet_group_name    = aws_db_subnet_group.db_subnet_group.name
  
#   backup_retention_period = 7
#   skip_final_snapshot     = true
# }

# resource "aws_rds_cluster_instance" "cluster_instances" {
#   identifier         = "${var.project_name}-${count.index}"
#   count              = 1
#   cluster_identifier = aws_rds_cluster.cluster.id
#   instance_class     = "db.t3.medium"
#   engine             = aws_rds_cluster.cluster.engine
#   engine_version     = aws_rds_cluster.cluster.engine_version
  
#   publicly_accessible = false
# }

# resource "aws_db_subnet_group" "db_subnet_group" {
#   name = "${var.project_name}-db-subnet-group"
#   subnet_ids = module.vpc.subnet_id
# }




resource "aws_rds_cluster" "cluster" {
  engine                       = var.engine_name
  engine_version               = var.engine_version
  availability_zones           = var.availability_zones
  db_subnet_group_name         = var.db_subnet_group_name
  cluster_identifier           = var.identifier
  database_name                = var.database_name
  master_username              = var.database_username
  master_password              = var.database_password
  port                         = var.database_port
  vpc_security_group_ids       = [var.db_security_group]
  skip_final_snapshot          = var.database_snapshot
  backup_retention_period      = 7
  preferred_backup_window      = "02:00-03:00"

  tags = local.required_tags
}
