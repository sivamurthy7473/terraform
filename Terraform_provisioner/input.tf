variable "location" {
  type        = string
  description = "region to create resources"
  default     = "ap-south-1"

}


variable "public_key_path" {
  type    = string
  default = "~/.ssh/id_rsa.pub"

}

variable "rollout_version" {
  type    = string
  default = "0.0.0.0"
}


variable "ntier_vpc_info" {
  type = object({
    ntier_subnet_name       = list(string)
    ntier_availability_zone = list(string)
    ntier_vpc_cidr          = string
    private_subnets         = list(string)
    public_subnets          = list(string)

    web_ec2_subnet = string


  })

  default = {
    ntier_subnet_name       = ["app1", "app2", "db1", "db2"]
    ntier_availability_zone = ["a", "b", "a", "b"]
    ntier_vpc_cidr          = "192.168.0.0/16"
    private_subnets         = ["db1", "db2"]
    public_subnets          = ["app1", "app2"]

    web_ec2_subnet = "app1"

  }

}
