terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.12.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  alias = "hyderabad"
}

provider "aws" {
  region = "us-east-2"
  alias = "mumbai"
}


