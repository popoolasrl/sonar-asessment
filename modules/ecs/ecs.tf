# ecs.tf

# module "vpc" {
#     source = "./modules/vpc"

#     project_name     = var.project_name
#   environment      = var.environment
#   vpc_cidr         = var.vpc_cidr
#   public_subnet    = var.public_subnet
#   private_subnet   = var.private_subnet
#   database_subnet  = var.database_subnet
#   availability_zones = var.availability_zones
#   cidr_block       = var.cidr_block
#   route_table_id   = var.route_table_id
#   gateway_id       = var.gateway_id
#   subnet_id        = var.subnet_id
#   id_app           = var.id_app
#   load_balancer_type = var.load_balancer_type
#   app_alb          = var.app_alb
#   alb_internal     = var.alb_internal
#   load_balancer_arn = var.load_balancer_arn
#   alb_listener_port = var.alb_listener_port
#   alb_listener_protocol = var.alb_listener_protocol
#   alb_listener_type = var.alb_listener_type
#   alb_target_group_arn = var.alb_target_group_arn
#   alb_target_group = var.alb_target_group
#   alb_target_group_port = var.alb_target_group_port
#   alb_target_group_protocol = var.alb_target_group_protocol
#   app_autoscaling_group = var.app_autoscaling_group
#   desired_capacity  = var.desired_capacity
#   max_size          = var.max_size
#   min_size          = var.min_size
#   db_subnet_group_name = var.db_subnet_group_name
#   alb_security_group_name = var.alb_security_group_name
#   app_security_group_name = var.app_security_group_name
#   db_security_group_name = var.db_security_group_name
#   alb_security_group = var.alb_security_group
#   app_security_group = var.app_security_group
# }

resource "aws_ecs_cluster" "ecs_cluster" {
  name = var.ecs_cluster_name
}

resource "aws_ecs_task_definition" "ecs_task" {
  family                   = var.project_name
  network_mode             = "awsvpc"
  requires_compatibilities = ["EC2"]
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = aws_iam_role.ecs_execution_role.arn

  container_definitions = <<DEFINITION
[
  {
    "name": "${var.project_name}-container",
    "image": "ami-0c0d141edc4f470cc",
    "cpu": 256,
    "memory": 512,
    "essential": true,
    "portMappings": [
      {
        "containerPort": ${var.ecs_container_port},
        "hostPort": 80,
        "protocol": "tcp"
      }
    ]
  }
]
DEFINITION
}

resource "aws_ecs_service" "ecs_service" {
  name            = var.ecs_service_name
  cluster         = aws_ecs_cluster.ecs_cluster.id
  task_definition = aws_ecs_task_definition.ecs_task.arn
  launch_type     = var.ecs_launch_type
  desired_count   = var.ecs_desired_count
  
#   max_capacity    = var.ecs_max_capacity
#   min_capacity    = var.ecs_min_capacity

  network_configuration {
    subnets = values(var.private_subnet)
    security_groups = [var.app_security_group]
    
  }

  depends_on = [aws_ecs_cluster.ecs_cluster]


}

resource "aws_iam_role" "ecs_execution_role" {
  name = "${var.project_name}-ecs-execution-role"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ecs-tasks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

