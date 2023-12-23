resource "aws_vpc" "ntier" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "ntier"
    }
  
}

# resource "aws_subnet" "ntiersubnet" {
#     availability_zone = "us-east-1a"
#     cidr_block = "10.0.1.0/24"
#     vpc_id = aws_vpc.ntier.id
#     tags = {
#       "Name" = "ntiersub1"
#     }
  
# }

# resource "aws_subnet" "ntiersubnet2" {
#     availability_zone = "us-east-1b"
#     cidr_block = "10.0.2.0/24"
#     vpc_id = aws_vpc.ntier.id
#      tags = {
#       "Name" = "ntiersub1"
#     }
  
# }

# resource "aws_subnet" "ntiersubnet3" {
#     availability_zone = "us-east-1c"
#     cidr_block = "10.0.3.0/24"
#     vpc_id = aws_vpc.ntier.id
#      tags = {
#       "Name" = "ntiersub1"
#     }
# }
#     resource "aws_subnet" "ntiersubnet4" {
#     availability_zone = "us-east-1d"
#     cidr_block = "10.0.4.0/24"
#     vpc_id = aws_vpc.ntier.id
#      tags = {
#       "Name" = "ntiersub4"
#     }
  
# }


resource "aws_subnet" "ntiersubnet" {
    for_each = {
      "ntier1" = { az = "us-east-1a",block = "10.0.1.0/24"}
      "ntier2" = {az = "us-east-1b",block = "10.0.2.0/24"}
      "ntier3" = {az = "us-east-1c",block = "10.0.3.0/24"}
      "ntier4" = {az= "us-east-1d",block = "10.0.4.0/24"}
    }

    availability_zone = each.value.az
    cidr_block = each.value.block
    vpc_id = aws_vpc.ntier.id
    tags = {
      "Name" = "ntiersub"
    }
  

  
}



