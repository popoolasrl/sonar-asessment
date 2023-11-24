variable "project_name" {
  description = "Name of Project"
  type = string
}

variable "environment" {
  description = "Environment Type"
  type = string
}

variable "engine_name" {
  description = "Database Type"
  type = string
}

variable "engine_version" {
  description = "Database Version"
  type = string
}

variable "storage" {
  description = "GB Storage"
  type = string
}

variable "db_subnet_group_name" {
  description = "Database Subnet Group"
  type = string
}

variable "identifier" {
  description = "Database Identifier"
  type = string
}

variable "instance_class" {
  description = "Instance Type of the Database"
  type = string
}

variable "multi_az" {
  description = "Database across multiple Availability Zones"
  type = string
}

variable "database_name" {
  description = "Database Name"
  type = string
}

variable "availability_zones" {
  description = "List of availability zones for the Aurora cluster"
  type        = list(string)
  default     = ["us-west-2a", "us-west-2b", "us-west-2c"]
}

variable "database_username" {
  description = "Database Username"
  type = string
}

variable "database_password" {
  description = "Database Password"
  sensitive = "true"
  type = string
}

variable "database_port" {
  description = "Database Port"
  type = string
}

variable "publicly_accessible" {
  description = "Database publicly accessible"
  type = string
}

variable "db_security_group" {
  description = "Database Security Group"
  type = string
}

variable "database_snapshot" {
  description = "Snapshot of the Database"
  type = string
}

