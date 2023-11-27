# variables.tf

variable "project_name" {
  description = "The name of the project"
  type        = string
}

variable "environment" {
  description = "The environment (e.g., dev, prod)"
  type        = string
}

variable "ecs_cluster_name" {
  description = "The name of the ECS cluster"
  type        = string
}

variable "ecs_instance_type" {
  description = "The EC2 instance type for ECS"
  type        = string
}

variable "ecs_desired_count" {
  description = "The desired number of tasks to run on the ECS service"
  type        = number
}

variable "ecs_max_capacity" {
  description = "The maximum number of tasks to run on the ECS service"
  type        = number
}

variable "ecs_min_capacity" {
  description = "The minimum number of tasks to run on the ECS service"
  type        = number
}

variable "ecs_container_port" {
  description = "The port on which the ECS container listens"
  type        = number
}

variable "ecs_task_definition" {
  description = "The ARN of the ECS task definition"
  type        = string
}

variable "ecs_service_name" {
  description = "The name of the ECS service"
  type        = string
}

variable "ecs_launch_type" {
  description = "The launch type on which to run your task (EC2 or FARGATE)"
  type        = string
}

variable "app_security_group" {
  description = "Application Security Group"
  type = string
}

variable "private_subnet" {
  description = "A list of private subnets inside the VPC"
  type        = map(string)
  # default = {
  #   "us-west-2a" : "10.0.101.0/24",
  #   "us-west-2b" : "10.0.102.0/24",
  #   "us-west-2c" : "10.0.103.0/24"
  # }
}