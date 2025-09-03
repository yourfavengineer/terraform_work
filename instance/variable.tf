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

#definting a list in terraform
variable "instance_size_list" {
  type = list(string)
  default = ["t2.micro",
    "t3.small",
  "t2.large"]
  description = "instance size using list "

}
#defining a map in terraform 

variable "instance_size_map" {
  type = map(string)
  default = {
    "dev"  = "t2.micro",
    "prod" = "t2.large",
    "qa"   = "t3.medium"

  }
  description = "instance type using mapping"
}
