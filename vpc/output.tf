output "vpc_name" {
  description = "vpc name"
  value = module.vpc.name
}

output "subnet_name" {
  description = "subnet Id number"
  value = module.vpc.public_subnets

}

output "igw_name" {
  description = "internet gateway"
  value = module.vpc.igw_id
}

output "nat_gateway" {
    description = "description of nat_gateway"
    value = module.vpc.natgw_ids
    
}

