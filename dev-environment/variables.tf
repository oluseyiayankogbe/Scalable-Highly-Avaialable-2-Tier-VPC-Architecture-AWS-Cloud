#vpc attributes
variable "region" {}
variable "project_name" {}
variable "enable_dns_hostnames" {}
variable "enable_dns_support" {}
#subnet attributes
variable "descriptor1" {}
variable "descriptor2" {}
variable "vpc_cidr" {}
variable "availability_zone" {}
variable "public_subnets_cidr" {}
variable "private_subnets_cidr" {}                    
variable "map_public_ip_on_launch" {}
variable "enable_resource_name_dns_a_record_on_launch" {}
variable "instance_tenancy" {}
variable "associate_public_ip_address" {}
#ec2 attributes
variable "linux_instance_type" {}               
variable "privateserver1" {}
variable "privateserver2" {}
variable "ami_id" {}             

#Iam profile attributes
variable "iam_instance_profile" {}

#route53 attributes
variable "root_domain_name" {}
variable "sub_domain_name" {}




