#START OF VPC PROVISION CODE

#1. Create VPC
resource "aws_vpc" "vpc2" {
  cidr_block           = "192.168.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "drtdev-accessory-vpc"
  }
}

#2. Create public subnet

resource "aws_subnet" "public-subnet2" {
  vpc_id                                      = aws_vpc.vpc2.id
  cidr_block                                  = "192.168.56.0/24"
  availability_zone                           = "us-west-1b"
  map_public_ip_on_launch                     = true
  enable_resource_name_dns_a_record_on_launch = true

  tags = {
    Name = "drt2-web-public-subnet2"
  }
}

#3. Create Internet Gateway
resource "aws_internet_gateway" "internet-gateway2" {
  vpc_id = aws_vpc.vpc2.id

  tags = {
    Name = "drt2-web-internet-gateway2"
  }
}

#4. Create Route Tables

#4a.Create pub Route Table 
resource "aws_route_table" "public-route-table2" {
  vpc_id = aws_vpc.vpc2.id
  #The command below attaches the pulic route table to the Internet gateway
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet-gateway2.id
  }


  tags = {
    Name = "drtdev2-public-route-table2"
  }
}

#5. Attach public Route Table to public subnet
resource "aws_route_table_association" "Attach-pub-route-table-pub-subnet2" {
  subnet_id     = aws_subnet.public-subnet2.id
  route_table_id = aws_route_table.public-route-table2.id
}






