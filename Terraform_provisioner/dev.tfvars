location = "us-east-2"
ntier_vpc_info = {
  ntier_subnet_name       = ["app1", "app2", "db1", "db2", "web1", "web2"]
  ntier_availability_zone = ["a", "b", "a", "b", "a", "b"]
  ntier_vpc_cidr          = "192.168.0.0/16"
  private_subnets         = ["db1", "db2", "app1", "app2"]
  public_subnets          = ["web1", "web2"]

  web_ec2_subnet     = "web1"
  ntier_keypair_path = "~/.ssh/id_rsa.pub"



}

