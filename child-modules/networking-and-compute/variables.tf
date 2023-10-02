variable "region" {}
 
variable "vpc_cidr" {}

variable "instance_tenancy" {}

variable "enable_dns_hostnames" {}

variable "enable_dns_support" {}

variable "project_name" {}

variable "descriptor1" {}

variable "descriptor2" {}

variable "map_public_ip_on_launch" {}

variable "enable_resource_name_dns_a_record_on_launch" {}

variable "availability_zone" {}

variable "public_subnets_cidr" {}

variable "private_subnets_cidr" {}


variable "associate_public_ip_address" {}

#ec2 attributes

variable "linux_instance_type" {}               

variable "privateserver1" {}

variable "privateserver2" {}   

variable "ami_id" {}  

#Iam profile attributes

variable "iam_instance_profile" {}

variable "root_domain_name" {}

variable "sub_domain_name" {}