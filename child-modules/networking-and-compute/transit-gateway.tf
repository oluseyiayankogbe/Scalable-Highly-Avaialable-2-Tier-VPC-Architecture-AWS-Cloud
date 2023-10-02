resource "aws_ec2_transit_gateway" "tgw" {
  description                     = "Transit Gateway testing scenario with 4 VPCs, 2 subnets each"
  default_route_table_association = "disable"
  default_route_table_propagation = "disable"
  tags                            = {
    Name                          = "${var.project_name}-tgw"
    
  }
}

# VPC attachment

resource "aws_ec2_transit_gateway_vpc_attachment" "tgw-att-vpc" {
  subnet_ids         =["${aws_subnet.public-subnets[0].id}", "${aws_subnet.public-subnets[1].id}"]
  transit_gateway_id = "${aws_ec2_transit_gateway.tgw.id}"
  vpc_id             = "${aws_vpc.vpc.id}"
  transit_gateway_default_route_table_association = false
  transit_gateway_default_route_table_propagation = false
  tags               = {
    Name             = "${var.project_name}-tgw-att-vpc"
    
  }
  
}

resource "aws_ec2_transit_gateway_vpc_attachment" "tgw-att-vpc2" {
  subnet_ids         = ["${aws_subnet.public-subnet2.id}"]
  transit_gateway_id = "${aws_ec2_transit_gateway.tgw.id}"
  vpc_id             = "${aws_vpc.vpc2.id}"
  transit_gateway_default_route_table_association = false
  transit_gateway_default_route_table_propagation = false
  tags               = {
    Name             = "${var.project_name}-tgw-att-vpc2"
   
  }
 
}

# Transit Gateway Route Table

resource "aws_ec2_transit_gateway_route_table" "tgw-rt-vpc1" {
  transit_gateway_id = "${aws_ec2_transit_gateway.tgw.id}"
  tags               = {
    Name             = "${var.project_name}-tgw-rt-vpc1"
    
  }
  
}

resource "aws_ec2_transit_gateway_route_table" "tgw-rt-vpc2" {
  transit_gateway_id = "${aws_ec2_transit_gateway.tgw.id}"
  tags               = {
    Name             = "${var.project_name}-tgw-rt-vpc2"
    
  }
  
}

# Route Tables Associations
## This is the link between a VPC (already symbolized with its attachment to the Transit Gateway)
##  and the Route Table the VPC's packet will hit when they arrive into the Transit Gateway.
## The Route Tables Associations do not represent the actual routes the packets are routed to.
## These are defined in the Route Tables Propagations section below.

resource "aws_ec2_transit_gateway_route_table_association" "tgw-rt-vpc-1-assoc" {
  transit_gateway_attachment_id  = "${aws_ec2_transit_gateway_vpc_attachment.tgw-att-vpc.id}"
  transit_gateway_route_table_id = "${aws_ec2_transit_gateway_route_table.tgw-rt-vpc1.id}"
}

resource "aws_ec2_transit_gateway_route_table_association" "tgw-rt-vpc-2-assoc" {
  transit_gateway_attachment_id  = "${aws_ec2_transit_gateway_vpc_attachment.tgw-att-vpc2.id}"
  transit_gateway_route_table_id = "${aws_ec2_transit_gateway_route_table.tgw-rt-vpc2.id}"
}

# Route Tables Propagations
## This section defines which VPCs will be routed from each Route Table created in the Transit Gateway

resource "aws_ec2_transit_gateway_route_table_propagation" "tgw-rt-to-vpc-1" {
  transit_gateway_attachment_id  = "${aws_ec2_transit_gateway_vpc_attachment.tgw-att-vpc.id}"
  transit_gateway_route_table_id = "${aws_ec2_transit_gateway_route_table.tgw-rt-vpc1.id}"
}

resource "aws_ec2_transit_gateway_route_table_propagation" "tgw-rt-to-vpc-2" {
  transit_gateway_attachment_id  = "${aws_ec2_transit_gateway_vpc_attachment.tgw-att-vpc2.id}"
  transit_gateway_route_table_id = "${aws_ec2_transit_gateway_route_table.tgw-rt-vpc2.id}"
}