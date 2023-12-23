output "igwid" {
  value = [aws_internet_gateway.igw.id]


}

output "apacheurl" {
  value = format("http://%s", aws_instance.webinstance.public_ip)
}