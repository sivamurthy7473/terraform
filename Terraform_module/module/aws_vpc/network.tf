resource "aws_vpc" "ntier_vpc" {
  cidr_block = "192.168.0.0/16"
  tags = {
    Name = "ntiervpc"
  }

}

resource "aws_subnet" "bastion" {
  vpc_id     = aws_vpc.ntier_vpc.id
  cidr_block = var.ntier_subnet

}
