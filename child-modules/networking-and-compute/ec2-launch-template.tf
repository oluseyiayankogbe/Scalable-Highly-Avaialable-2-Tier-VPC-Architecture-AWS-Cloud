resource "aws_launch_template" "launch-template" {
  name_prefix = "${var.project_name}-launch-template"
  image_id = "ami-00569bbcd6801d0e2" 
  instance_type = "t2.micro"
  network_interfaces {
    security_groups = [ "${aws_security_group.sg.id}" ]

    associate_public_ip_address = true
  }
  
  
  user_data = filebase64("../child-modules/networking-and-compute/ec2-user-data.sh")
  
  lifecycle {
      create_before_destroy = true
    }
}



