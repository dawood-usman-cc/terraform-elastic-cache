terraform {
  backend "s3" {
    bucket  = "codingcops-statefile-bkt"
    key     = "elasticache-redis/terraform.tfstate"
    region  = "ap-south-1"
    encrypt = true
  }
}