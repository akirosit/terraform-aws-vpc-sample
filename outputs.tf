output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}

output "subnets" {
  description = "An object representing the subnets. The key is the CIDR blocks of each subnet, the values are `id` and `availability_zone`"
  value = { for i, o in aws_subnet.main : i => {
    id                = o.id
    availability_zone = o.availability_zone
  } }
}
