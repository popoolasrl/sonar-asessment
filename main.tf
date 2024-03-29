provider "aws" {
  region = var.region
}

module "vpc" {
  source                    = "./modules/vpc"
  project_name              = var.project_name
  environment               = var.environment
  vpc_id                    = module.vpc.vpc_id
  vpc_cidr                  = var.vpc_cidr
  public_subnet             = var.public_subnet
  private_subnet            = var.private_subnet
  database_subnet           = var.database_subnet
  availability_zones        = var.availability_zones
  cidr_block                = var.cidr_block
  route_table_id            = var.route_table_id
  gateway_id                = module.vpc.gateway_id
  subnet_id                 = var.subnet_id
  id_app                    = module.ec2.id_app
  load_balancer_type        = var.load_balancer_type
  app_alb                   = var.app_alb
  alb_internal              = var.alb_internal
  load_balancer_arn         = var.load_balancer_arn
  alb_listener_port         = var.alb_listener_port
  alb_listener_protocol     = var.alb_listener_protocol
  alb_listener_type         = var.alb_listener_type
  alb_target_group_arn      = var.alb_target_group_arn
  alb_target_group          = var.alb_target_group
  alb_target_group_port     = var.alb_target_group_port
  alb_target_group_protocol = var.alb_target_group_protocol
  app_autoscaling_group     = var.app_autoscaling_group
  desired_capacity          = var.desired_capacity
  max_size                  = var.max_size
  min_size                  = var.min_size
  db_subnet_group_name      = var.db_subnet_group_name
  alb_security_group_name   = var.alb_security_group_name
  app_security_group_name   = var.app_security_group_name
  db_security_group_name    = var.db_security_group_name
  alb_security_group        = module.vpc.alb_security_group
  app_security_group        = var.app_security_group

}

module "ec2" {
  source             = "./modules/ec2"
  project_name       = var.project_name
  environment        = var.environment
  image_id           = var.image_id
  instance_type      = var.instance_type
  app_security_group = module.vpc.app_security_group
  name_prefix        = var.name_prefix
  key_name           = var.key_name
  connection_type    = var.connection_type
  connection_user    = var.connection_user
  connection_host    = var.connection_host
}

module "rds" {
  source               = "./modules/rds"
  project_name         = var.project_name
  environment          = var.environment
  engine_name          = var.engine_name
  engine_version       = var.engine_version
  storage              = var.storage
  db_subnet_group_name = module.vpc.aws_db_subnet_group_main
  identifier           = var.identifier
  instance_class       = var.instance_class
  multi_az             = var.multi_az
  database_name        = var.database_name
  database_username    = var.database_username
  database_password    = var.database_password
  database_port        = var.database_port
  publicly_accessible  = var.publicly_accessible
  db_security_group    = module.vpc.db_security_group
  database_snapshot    = var.database_snapshot
}

module "backup" {
  source            = "./modules/backup"
  backup_vault_name = "sonar_backup_vault"
  backup_plan_name  = "sonar_backup_plan"
  backup_rule_name  = "sonar_backup_rule"
  backup_role_name  = "sonar_backup_role"
}


module "s3" {
  source        = "./modules/s3"
  bucket_name   = "my-unique-bucket-name"
  acl           = "private"
  versioning    = true
  force_destroy = true

}

module "ecs" {
  source              = "./modules/ecs"
  project_name        = var.project_name
  private_subnet      = var.private_subnet
  environment         = var.environment
  app_security_group  = module.vpc.app_security_group
  ecs_cluster_name    = var.ecs_cluster_name
  ecs_instance_type   = var.ecs_instance_type
  ecs_desired_count   = var.ecs_desired_count
  ecs_max_capacity    = var.ecs_max_capacity
  ecs_min_capacity    = var.ecs_min_capacity
  ecs_container_port  = var.ecs_container_port
  ecs_task_definition = var.ecs_task_definition
  ecs_service_name    = var.ecs_service_name
  ecs_launch_type     = var.ecs_launch_type
}

