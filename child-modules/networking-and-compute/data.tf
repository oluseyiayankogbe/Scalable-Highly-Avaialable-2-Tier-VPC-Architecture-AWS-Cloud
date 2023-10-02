
data "aws_route53_zone" "root-domain" {
  name = var.root_domain_name
}



#0. Create IAM Instance Profile With Attached IAM Role

data "aws_iam_instance_profile" "drt-iam-profile" {
  name = var.iam_instance_profile
  #role = var.role
}

