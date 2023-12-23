resource "aws_vpc" "ntier_vpc" {
  cidr_block = var.ntier_vpc
  tags = {
    Name = "ntiervpc-${terraform.workspace}"
    Env  = terraform.workspace
  }

}

resource "aws_subnet" "bastion" {
  count      = terraform.workspace == "qa" ? 1 : 0
  vpc_id     = aws_vpc.ntier_vpc.id
  cidr_block = "192.168.0.0/24"

}
