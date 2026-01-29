aws_region   = "ap-south-1"
project_name = "CodingCops"
environment  = "staging"
cluster_name = "staging"

# VPC Configuration - UPDATE THESE VALUES
vpc_id = "vpc-xxxxxxxxxxxxxxxxx"  # Replace with your VPC ID
subnet_ids = [
  "subnet-xxxxxxxxxxxxxxxxx",     # Replace with your subnet IDs
  "subnet-yyyyyyyyyyyyyyyyy"      # At least 2 subnets in different AZs
]

# ElastiCache Configuration
engine_version  = "7.1"
node_type       = "cache.t4g.small"
num_cache_nodes = 2  # 1 primary + 1 replica
port            = 6379

# Security - UPDATE WITH YOUR CIDR
allowed_cidr_blocks = [
  "10.0.0.0/16"  # Replace with your VPC CIDR or specific IP ranges
]