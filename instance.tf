resource "aws_instance" "aws_instance_demo" {

  ami           = data.aws_ami.ami-linux.id 
  instance_type = var.size
  user_data     = file("${path.module}/app1-install.sh")
  key_name      = var.instance_keypair
  vpc_security_group_ids = [ aws_security_group.web-sg.id, aws_security_group.vpc-ssh.id  ]
  tags = {
    Name = "test-instance"
  }
}
