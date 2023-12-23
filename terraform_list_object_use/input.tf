variable "ntiersg_info" {
    type = object({
      name = string
      vpc_id = string
      security_group_id = string
      rules = list(object({
      type       = string
      from_port  = number
      to_port    = number
      protocol   = string
      cidr_block = string
      }))
    })

    default = {
      name = "ntier"
      vpc_id = "aws_vpc_id"
      security_group_id = "aws_securitysg.id"
      rules = [ {
         type       = string
      from_port  = number
      to_port    = number
      protocol   = string
      cidr_block = string
        
      }]
    }
    description = "gguguhuh"
  
}