
module "vpc" {
  source = "../child-modules/networking-and-compute"
 

  #vpc atttributes
  project_name         = var.project_name
  region               = var.region
  vpc_cidr             = var.vpc_cidr
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support
  #subnet attributes
  descriptor1                                 = var.descriptor1
  descriptor2                                 = var.descriptor2
  public_subnets_cidr                         = var.public_subnets_cidr
  private_subnets_cidr                        = var.private_subnets_cidr
  availability_zone                           = var.availability_zone
  map_public_ip_on_launch                     = var.map_public_ip_on_launch
  enable_resource_name_dns_a_record_on_launch = var.enable_resource_name_dns_a_record_on_launch
  instance_tenancy                            = var.instance_tenancy
  #ec2 attributes
  linux_instance_type               = var.linux_instance_type
  associate_public_ip_address = var.associate_public_ip_address
  privateserver1              = var.privateserver1
  privateserver2              = var.privateserver2
  ami_id                         = var.ami_id

  #Iam profile attributes
  iam_instance_profile        = var.iam_instance_profile




  #Route53 Attributes
  root_domain_name = var.root_domain_name
  sub_domain_name = var.sub_domain_name
}


module "key-pair" {
  source       = "../child-modules/key-pair"
  project_name = var.project_name
}















