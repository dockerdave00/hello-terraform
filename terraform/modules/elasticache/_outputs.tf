output "elasticache_nodes"{
  value = aws_elasticache_cluster.common.cache_nodes.0.address
}
