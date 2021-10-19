output "elasticache_nodes" {
  value = aws_elasticache_cluster.common.cache_nodes.0.address
}

output "ecache_security_group" {
  value = aws_security_group.allow_elasticache.id
}
