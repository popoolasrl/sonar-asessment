# ecs.tfvars

# project_name          = "three-tier-architecture"
# environment           = "dev"
# ecs_cluster_name      = "sonar-ecs-cluster"
# ecs_instance_type      = "t2.micro"
# ecs_desired_count      = 2
# ecs_max_capacity       = 4
# ecs_min_capacity       = 1
# ecs_container_port     = 80
# ecs_task_definition    = "sonar-ecs-task-definition-arn"
# ecs_service_name       = "sonar-ecs-service"
# ecs_launch_type        = "EC2"

project_name = [
  "three-tier-architecture"
]

environment = [
  "dev"
]

ecs_cluster_name = [
  "ecs-cluster"
]

ecs_instance_type = [
  "t2.micro"
]

ecs_desired_count = [
  "2"
]

ecs_max_capacity = [
  "4"
]

ecs_min_capacity = [
  "1"
]

ecs_container_port = [
  "80"
]

ecs_task_definition = [
  "ecs-task-definition2"
]

ecs_service_name = [
  "ecs-service"
]

ecs_launch_type = [
  "EC2"
]
