variable "location" {
  type        = string
  description = "region to create resources"
  default     = "us-east-1"

}



variable "ntier_subnet" {
  type        = string
  description = "value of subnet"
  default     = "192.168.0.0/24"

}

