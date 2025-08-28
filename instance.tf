resource "aws_instance" "aws_instance_demo" {

  ami                    = data.aws_ami.ami-linux.id
  instance_type          = var.instance_size_list[1]
  user_data              = file("${path.module}/app1-install.sh")
  key_name               = var.instance_keypair
  vpc_security_group_ids = [aws_security_group.web-sg.id, aws_security_group.vpc-ssh.id]
  count = 2
  tags = {
    Name = "list_test-instance"
  
  }
}


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
