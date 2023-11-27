# outputs.tf

output "ecs_cluster_id" {
  value = aws_ecs_cluster.ecs_cluster.id
}

output "ecs_service_id" {
  value = aws_ecs_service.ecs_service.id
}

output "subnet_ids" {
  value = values(var.private_subnet)
}