# ElastiCache Subnet Group
resource "aws_elasticache_subnet_group" "this" {
  name       = "${var.cluster_name}-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name        = "${var.cluster_name}-subnet-group"
    Environment = var.environment
  }
}

# Security Group for ElastiCache
resource "aws_security_group" "this" {
  name        = "${var.cluster_name}-redis-sg"
  description = "Security group for ElastiCache Redis cluster ${var.cluster_name}"
  vpc_id      = var.vpc_id

  # Ingress rule for Redis port
  ingress {
    description = "Redis port"
    from_port   = var.port
    to_port     = var.port
    protocol    = "tcp"
    cidr_blocks = var.allowed_cidr_blocks
  }

  # Egress rule - allow all outbound
  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.cluster_name}-redis-sg"
    Environment = var.environment
  }
}

# ElastiCache Replication Group (Redis)
resource "aws_elasticache_replication_group" "this" {
  replication_group_id       = var.cluster_name
  description = "Redis cluster for ${var.cluster_name}"
  
  # Engine Configuration
  engine               = "redis"
  engine_version       = var.engine_version
  port                 = var.port
  parameter_group_name = "default.redis7"
  node_type            = var.node_type
  
  # Cluster Configuration
  num_cache_clusters         = var.num_cache_nodes  # 1 primary + replicas
  automatic_failover_enabled = false                # Auto-failover disabled
  multi_az_enabled          = false                 # Multi-AZ disabled
  
  # Network Configuration
  subnet_group_name  = aws_elasticache_subnet_group.this.name
  security_group_ids = [aws_security_group.this.id]
  
  # Maintenance and Backup
  maintenance_window          = "sun:05:00-sun:06:00"
  snapshot_window            = "03:00-04:00"
  snapshot_retention_limit   = 5
  auto_minor_version_upgrade = true
  
  # Encryption
  at_rest_encryption_enabled = true
  transit_encryption_enabled = false  # Set to true if you need encryption in transit
  
  tags = {
    Name        = var.cluster_name
    Environment = var.environment
  }
}

