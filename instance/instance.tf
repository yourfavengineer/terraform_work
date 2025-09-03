

resource "aws_instance" "aws_instance_dev" {
  ami                    = data.aws_ami.ami-linux.id
  instance_type          = var.instance_size_map["dev"]
  user_data              = file("${path.module}/app1-install.sh")
  key_name               = var.instance_keypair
  vpc_security_group_ids = [aws_security_group.web-sg.id, aws_security_group.vpc-ssh.id]
  tags = {
    Name = "dev-instance"
  }
  count = 2
}

resource "aws_instance" "aws_instance_prod" {

  ami                    = data.aws_ami.ami-linux.id
  instance_type          = var.instance_size_map["prod"]
  user_data              = file("${path.module}/app1-install.sh")
  key_name               = var.instance_keypair
  vpc_security_group_ids = [aws_security_group.web-sg.id, aws_security_group.vpc-ssh.id]
  tags = {
    Name = "prod-instance"
  }
  count = 2
}


resource "aws_instance" "aws_instance_for_each" {

  ami                    = data.aws_ami.ami-linux.id
  instance_type          = var.instance_size_map["dev"]
  user_data              = file("${path.module}/app1-install.sh")
  key_name               = var.instance_keypair
  vpc_security_group_ids = [aws_security_group.web-sg.id, aws_security_group.vpc-ssh.id]
  for_each = toset(keys({
    for az, details in data.aws_ec2_instance_type_offerings.my_az3: 
    az => details.instance_types if length(details.instance_types) != 0 }))
  availability_zone = each.key
  tags = {
    Name = "For-Each-${each.value}"
  
  }


}