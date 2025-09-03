data "aws_ami" "ami-linux" {

  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-gp2"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

data "aws_availability_zones" "my_azs" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
    
  }
  
}

data "aws_ec2_instance_type_offerings" "my_az3" {
  for_each = toset(data.aws_availability_zones.my_azs.names)
  filter {
    name   = "instance-type"
    values = [var.instance_size_list[1]]
  }
  filter {
    name   = "location"
    values = [each.key]
  }
  location_type = "availability-zone"
}

