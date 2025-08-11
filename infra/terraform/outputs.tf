output "ecr_frontend" {
  value = aws_ecr_repository.frontend.repository_url
}

output "ecr_backend" {
  value = aws_ecr_repository.backend.repository_url
}

output "redis_primary_endpoint" {
  value = aws_elasticache_replication_group.redis.primary_endpoint_address
}
