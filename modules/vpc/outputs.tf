output "vpc_id" {
  description = "The VPC to be deployed"
  value = aws_vpc.main.id
}

output "gateway_id" {
  description = "Identifier of the VPC Internet Gateway" 
  value = aws_internet_gateway.main.id
}

output "aws_db_subnet_group_main" {
  description = "Database Subnet Group"
  value = aws_db_subnet_group.main.id
}

output "app_security_group" {
  description = "App Instance Security Group"
  value = aws_security_group.app_security_group.id
}

output "alb_security_group" {
  description = "Application Load Balancer Security Group"
  value = aws_security_group.alb_security_group.id
}

output "db_security_group" {
  description = "Database Security Group"
  value = aws_security_group.db_security_group.id
}

output "private_subnets" {
  description = "List of private subnet IDs"
  # value       = aws_subnet.private_subnet[*].id
  value       = [for subnet in aws_subnet.private_subnet : subnet.id]
}

output "public_subnets" {
  description = "List of public subnet IDs"
  # value       = values(aws_subnet.public_subnet[*].id)
  value       = [for subnet in aws_subnet.public_subnet : subnet.id]
}

output "database_subnets" {
  description = "List of database subnet IDs"
  # value       = values(aws_subnet.database_subnet[*].id)
  value       = [for subnet in aws_subnet.database_subnet : subnet.id]
}