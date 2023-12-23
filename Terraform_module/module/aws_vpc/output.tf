output "vpc_id" {
    value = aws_vpc.ntier_vpc.id
  
}

output "subnet_id" {
    value = aws_subnet.bastion.id
  
}
