terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
  }

}
provider "aws" {
  profile = "default"
  region  = "us-east-1"

}

provider "azurerm" {
  profile = "profile-1"
}
provider "kubernetes" {
  # Configuration options
}