variable "location" {
  type        = string
  description = "region to create resources"
  default     = "us-east-1"

}

variable "ntier_vpc" {
  type        = string
  description = "value of vpc"
  default     = "192.168.0.0/16"

}

