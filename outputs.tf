output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}

output "subnets" {
  description = "A map representing the subnets. The key is the CIDR blocks and the value is the `id`"
  value       = { for k, s in aws_subnet.main : k => s.id }
}
