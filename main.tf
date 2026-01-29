module "elasticache" {
  source = "./modules/elasticache"

  cluster_name        = var.cluster_name
  environment         = var.environment
  vpc_id              = var.vpc_id
  subnet_ids          = var.subnet_ids
  engine_version      = var.engine_version
  node_type           = var.node_type
  num_cache_nodes     = var.num_cache_nodes
  port                = var.port
  allowed_cidr_blocks = var.allowed_cidr_blocks
}
