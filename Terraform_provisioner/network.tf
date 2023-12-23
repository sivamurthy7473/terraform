resource "aws_vpc" "ntier_vpc" {
  cidr_block = var.ntier_vpc_info.ntier_vpc_cidr
  tags = {
    Name = "ntiervpc"
  }

}


resource "aws_subnet" "subnets" {
  count             = length(var.ntier_vpc_info.ntier_subnet_name)
  vpc_id            = local.vpc_id
  availability_zone = "${var.location}${var.ntier_vpc_info.ntier_availability_zone[count.index]}"
  cidr_block        = cidrsubnet(var.ntier_vpc_info.ntier_vpc_cidr, 8, count.index)
  tags = {
    Name = var.ntier_vpc_info.ntier_subnet_name[count.index]
  }

  depends_on = [aws_vpc.ntier_vpc]
}

resource "aws_internet_gateway" "igw" {
  vpc_id = local.vpc_id
  tags = {
    Name = "ntier_igw"
  }

  depends_on = [aws_subnet.subnets]

}

resource "aws_route_table" "private" {
  vpc_id = local.vpc_id
  tags = {
    Name = "private"
  }

  depends_on = [aws_subnet.subnets]

}

resource "aws_route_table" "public" {
  vpc_id = local.vpc_id
  tags = {
    Name = "public"
  }
  route {
    cidr_block = local.anywhere
    gateway_id = aws_internet_gateway.igw.id
  }

  depends_on = [aws_subnet.subnets]

}

data "aws_subnets" "private" {
  filter {
    name   = "tag:Name"
    values = var.ntier_vpc_info.private_subnets
  }

  filter {
    name   = "vpc-id"
    values = [local.vpc_id]
  }
  depends_on = [aws_subnet.subnets]

}

resource "aws_route_table_association" "private" {
  count          = length(var.ntier_vpc_info.private_subnets)
  subnet_id      = data.aws_subnets.private.ids[count.index]
  route_table_id = aws_route_table.private.id



}

data "aws_subnets" "public" {
  filter {
    name   = "tag:Name"
    values = var.ntier_vpc_info.public_subnets
  }

  filter {
    name   = "vpc-id"
    values = [local.vpc_id]
  }
  depends_on = [aws_subnet.subnets]

}

resource "aws_route_table_association" "public" {
  count          = length(var.ntier_vpc_info.public_subnets)
  subnet_id      = data.aws_subnets.public.ids[count.index]
  route_table_id = aws_route_table.public.id

}
