resource "aws_vpc" "tfer--vpc-033a3c5eee54e15fe" {
  assign_generated_ipv6_cidr_block     = "false"
  cidr_block                           = var.vpc_cidr_1
  enable_dns_hostnames                 = "true"
  enable_dns_support                   = "true"
  enable_network_address_usage_metrics = "false"
  instance_tenancy                     = "default"
  ipv6_netmask_length                  = "0"

  tags = {
    Name = "x-thon-vpc"
  }

  tags_all = {
    Name = "x-thon-vpc"
  }
}

resource "aws_vpc" "tfer--vpc-04379a300188fe377" {
  assign_generated_ipv6_cidr_block     = "false"
  cidr_block                           = var.vpc_cidr_2
  enable_dns_hostnames                 = "true"
  enable_dns_support                   = "true"
  enable_network_address_usage_metrics = "false"
  instance_tenancy                     = "default"
  ipv6_netmask_length                  = "0"
}
