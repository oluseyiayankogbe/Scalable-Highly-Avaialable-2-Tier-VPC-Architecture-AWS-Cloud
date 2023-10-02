
#2. Define The Local Varying Values using the "locals" descriptor
locals {
  aws_instance = {
    "private-1" = { subnet_id = aws_subnet.private-subnets[0].id, tags = { Name = "${var.privateserver1}-ec2" } }
    "private-2" = { subnet_id = aws_subnet.private-subnets[1].id, tags = { Name = "${var.privateserver2}-ec2" } }
  }
}

#3. Create The EC2 Instance
resource "aws_instance" "ec2" {
  for_each                    = local.aws_instance
  subnet_id                   = each.value.subnet_id
  tags                        = each.value.tags
  ami                         = var.ami_id
  #ami                         = data.aws_ami.amazon-linux-2.id
  instance_type               = var.linux_instance_type
  key_name                    = "${var.project_name}-key"
  vpc_security_group_ids      = ["${aws_security_group.sg.id}"]
  iam_instance_profile        = var.iam_instance_profile
  associate_public_ip_address = var.associate_public_ip_address


user_data = "${file("../child-modules/networking-and-compute/ec2-user-data.sh")}"

}

