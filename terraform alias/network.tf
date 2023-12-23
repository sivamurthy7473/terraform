resource "aws_vpc" "ntiervpc1" {
  cidr_block = "192.168.0.0/24"
  
     provider = aws.mumbai
  }

  


resource "aws_vpc" "ntiervpc2" {
  cidr_block = "192.168.0.0/16"
  provider = aws.hyderabad
  
}
