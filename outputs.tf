################################################################################
## network
################################################################################
output "vpc_id" {
  description = "ID of the VPC"
  value       = data.aws_vpc.vpc.id
}

output "vpc_name" {
  description = "Name of the VPC"
  value       = data.aws_vpc.vpc.tags["Name"]
}

output "private_subnet_ids" {
  description = "Private subnet IDs"
  value       = data.aws_subnets.private.ids
}

output "public_subnet_ids" {
  description = "Public subnet IDs"
  value       = data.aws_subnets.public.ids
}
