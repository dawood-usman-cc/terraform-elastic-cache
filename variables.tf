variable "aws_region" {
  description = "AWS region for resources"
  type        = string
  default     = "ap-south-1"
}

variable "project_name" {
  description = "Project name for tagging"
  type        = string
}

variable "environment" {
  description = "Environment name (dev, staging, prod)"
  type        = string
}

variable "cluster_name" {
  description = "Name of the ElastiCache cluster"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where ElastiCache will be deployed"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for ElastiCache subnet group"
  type        = list(string)
}

variable "engine_version" {
  description = "Redis engine version"
  type        = string
  default     = "7.1"
}

variable "node_type" {
  description = "ElastiCache node type"
  type        = string
  default     = "cache.t4g.small"
}

variable "num_cache_nodes" {
  description = "Number of cache nodes (primary + replicas)"
  type        = number
  default     = 2
}

variable "port" {
  description = "Redis port"
  type        = number
  default     = 6379
}

variable "allowed_cidr_blocks" {
  description = "CIDR blocks allowed to access ElastiCache"
  type        = list(string)
}