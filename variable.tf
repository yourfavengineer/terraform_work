variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "Defining the AWS region for my instance"
}


variable "availability_zone" {
  type        = string
  default     = "us-east-1a"
  description = "Defining the region  I want the Instance"
}


variable "size" {
  type        = string
  default     = "t2.micro"
  description = "instance size"

}

variable "instance_keypair" {
  type        = string
  default     = "terraform_key"
  description = "instance key pair"
}
