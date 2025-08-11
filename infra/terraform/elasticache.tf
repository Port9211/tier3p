resource "aws_security_group" "redis_sg" {
  name        = "${var.cluster_name}-redis-sg"
  description = "Allow Redis traffic from EKS nodes"
  vpc_id      = var.vpc_id
}

resource "aws_elasticache_subnet_group" "redis_subnets" {
  name       = "${var.cluster_name}-redis-subnet-group"
  subnet_ids = var.private_subnet_ids
}

resource "aws_elasticache_replication_group" "redis" {
  replication_group_id          = "${var.cluster_name}-redis"
  replication_group_description = "Redis cluster for apps"
  engine                        = "redis"
  node_type                     = "cache.t3.micro"
  number_cache_clusters         = 1
  subnet_group_name             = aws_elasticache_subnet_group.redis_subnets.name
  security_group_ids            = [aws_security_group.redis_sg.id]
  automatic_failover_enabled    = false
}
