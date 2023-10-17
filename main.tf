################################################################
## defaults
################################################################
terraform {
  required_version = "~> 1.4"

  required_providers {
    aws = {
      version = "~> 4.0"
      source  = "hashicorp/aws"
    }
  }
}
###############################################
## imports
################################################
## network
data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = ["${var.namespace}-${var.environment}-vpc"]
  }
}

data "aws_subnets" "private" {
  filter {
    name = "tag:Name"
    values = [
      "${var.namespace}-${var.environment}-private-${var.region}a",
      "${var.namespace}-${var.environment}-private-${var.region}b",
    ]
  }
}

data "aws_subnets" "public" {
  filter {
    name = "tag:Name"
    values = [
      "${var.namespace}-${var.environment}-public-${var.region}a",
      "${var.namespace}-${var.environment}-public-${var.region}b",
    ]
  }
}
