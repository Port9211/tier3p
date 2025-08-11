
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
  replication_group_id = "${var.cluster_name}-redis"
  description          = "Redis cluster for apps" # updated field name
  engine               = "redis"
  engine_version       = "7.0"                    # explicitly set version
  node_type            = "cache.t3.micro"

  num_cache_clusters   = 1                        # updated from number_cache_clusters
  subnet_group_name    = aws_elasticache_subnet_group.redis_subnets.name
  security_group_ids   = [aws_security_group.redis_sg.id]

  automatic_failover_enabled = false
}
