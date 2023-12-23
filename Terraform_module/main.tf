terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.12.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "aws_vpc" {
  source       = "./module/aws_vpc"
  location     = "us-east-1"
  ntier_subnet = "192.168.0.0/24"



}

output "subnet_id" {
  value = module.aws_vpc.subnet_id


}

output "vpc_id" {
  value = module.aws_vpc.vpc_id

}