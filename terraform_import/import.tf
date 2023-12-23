resource "aws_vpc" "import_vpc" {
     arn                                  = "arn:aws:ec2:us-east-1:797892109283:vpc/vpc-0a9ae13deee681bc4"
    assign_generated_ipv6_cidr_block     = false
    cidr_block                           = "10.0.0.0/24"
    default_network_acl_id               = "acl-0f7f47bf3a4dca97a"
    default_route_table_id               = "rtb-0500da4f79f33b044"
    default_security_group_id            = "sg-0845741d6e9c9dea6"
    dhcp_options_id                      = "dopt-02dd9c35f93984bd8"
    enable_dns_hostnames                 = false
    enable_dns_support                   = true
    enable_network_address_usage_metrics = false
    id                                   = "vpc-0a9ae13deee681bc4"
    instance_tenancy                     = "default"
     tags                                 = {
        "Name" = "import_vpc"
    }
    tags_all                             = {
        "Name" = "import_vpc"
    }
    
     
  
}