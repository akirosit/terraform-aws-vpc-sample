output "id" {
  value = module.vpc.vpc_id
}

output "subnets" {
  value = module.vpc.subnets
}
