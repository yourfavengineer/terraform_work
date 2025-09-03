#using the public IP of all stated resources 

output "for_output_map_dev" {
  description = "for output dev"
  value       = { for c, instance in aws_instance.aws_instance_dev : c => instance.public_ip }
}
output "foreach_output_map_dev" {
  description = "foreach map instance public ip"
  value = {for azs, instance in aws_instance.aws_instance_dev:  azs => instance.public_ip}
}


output "for_output_map_prod" {
  description = "for map prod output"
  value       = { for c, instance in aws_instance.aws_instance_prod : c => instance.public_ip }
}

output "foreach_output_map_prod" {
  description = "for each map prod output"
  value = {for azs, instance in aws_instance.aws_instance_prod: azs => instance.public_ip}
}


output "output_myaz-3" {
  value = keys({
    for az, details in data.aws_ec2_instance_type_offerings.my_az3: 
    az => details.instance_types if length(details.instance_types) != 0 })
  }
  