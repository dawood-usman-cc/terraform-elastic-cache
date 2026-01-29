output "elasticache_cluster_id" {
  description = "ElastiCache cluster ID"
  value       = module.elasticache.cluster_id
}

output "elasticache_primary_endpoint" {
  description = "Primary endpoint address"
  value       = module.elasticache.primary_endpoint_address
}

output "elasticache_reader_endpoint" {
  description = "Reader endpoint address"
  value       = module.elasticache.reader_endpoint_address
}

output "elasticache_port" {
  description = "ElastiCache port"
  value       = module.elasticache.port
}

output "elasticache_security_group_id" {
  description = "Security group ID for ElastiCache"
  value       = module.elasticache.security_group_id
}

output "connection_string" {
  description = "Redis connection string"
  value       = "redis://${module.elasticache.primary_endpoint_address}:${module.elasticache.port}"
}