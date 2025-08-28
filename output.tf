#using the public IP of all stated resources 

output "instance_public_ip" {
  value       = aws_instance.aws_instance_demo[*].public_ip
  description = "ec2 instance public IP "
}

output "instance_public_dns" {
  value       = aws_instance.aws_instance_demo[*].public_dns
  description = "ec2 instance publicdns "
}


output "for_output_map_dev" {
  description = "for output dev"
  value       = { for c, instance in aws_instance.aws_instance_dev : c => instance.public_ip }
}
output "for_output_map_prod" {
  description = "for map prod output"
  value       = { for c, instance in aws_instance.aws_instance_prod : c => instance.public_ip }
}
