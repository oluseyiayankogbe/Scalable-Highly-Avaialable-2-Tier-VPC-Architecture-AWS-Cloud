
#primary vpc atttributes
project_name         = "drtdev"
region               = "us-west-1"
vpc_cidr             = "172.32.0.0/16"
enable_dns_hostnames = true
enable_dns_support   = true

#primary subnet attributes
descriptor1                                 = "drt-web"
descriptor2                                 = "drt-app"
public_subnets_cidr                         = ["172.32.51.0/24", "172.32.52.0/24"]
private_subnets_cidr                        = ["172.32.53.0/24", "172.32.54.0/24"]
availability_zone                           = ["us-west-1b", "us-west-1c"]
map_public_ip_on_launch                     = true
enable_resource_name_dns_a_record_on_launch = true
instance_tenancy                            = "default"
associate_public_ip_address = true

#ec2 attributes
linux_instance_type = "t2.micro"
privateserver1              = "app-private-1-dev"
privateserver2              = "app-private-2-dev"
ami_id                         = "ami-00569bbcd6801d0e2"
#associate_public_ip_address = true

#Iam profile attributes
iam_instance_profile        = "Reusable"



#Route53 Attributes
root_domain_name = "junoeducative.com"
sub_domain_name = "ekow"











