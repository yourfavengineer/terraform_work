resource "aws_security_group" "vpc-ssh" {
  name        = "default_bvpc"
  description = "Dev VPC SSH"

  ingress {
    description = "Allow Port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all IP and Ports outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    name = "vpc-ssh"

  }
}
#WEB TRAFFFIC SECURITY GROUP 

resource "aws_security_group" "web-sg" {
  name        = "web-securrity group"
  description = "web service port"

  ingress {
    description = "Allow Port 22"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all IP and Ports outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    name = "web-security-group"

  }
}