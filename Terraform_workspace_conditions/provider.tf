terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.12.0"
    }
  }
  backend "s3" {
    region         = "us-east-1"
    bucket         = "terraformbackendstore"
    key            = "terraform/lock"
    dynamodb_table = "terraformbackend"
  }
}


provider "aws" {
  # Configuration options

  region = var.location
}



