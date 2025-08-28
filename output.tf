output instance_public_ip {
  value       = aws_instance.aws_instance_demo.public_ip
  description = "ec2 instance public IP "

}

output "instance_public_dns" {
  value       = aws_instance.aws_instance_demo.public_dns
  description = "instance public_dns"
}

output instance_private_dns {
  value       = aws_instance.aws_instance_demo.private_dns
  sensitive   = true
  description = "instance private_dns"
}

output instance_id {
  value       = aws_instance.aws_instance_demo.id 
  description = "instance indentification number"
}
