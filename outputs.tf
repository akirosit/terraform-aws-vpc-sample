output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}

output "subnets_id" {
  description = "A list containing every subnet's ID"
  value       = aws_subnet.main.*.id
}
