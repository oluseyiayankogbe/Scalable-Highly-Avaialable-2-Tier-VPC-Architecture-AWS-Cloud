#create network load balancer
resource "aws_lb" "network-load-balancer" {
  name               = "${var.project_name}-network-load-balancer"
  internal           = false
  load_balancer_type = "network"
  #subnets            = [for subnet in aws_subnet.public-subnets : subnets[*].id]
  subnets            =  ["${aws_subnet.public-subnets[0].id}", "${aws_subnet.public-subnets[1].id}"]

  enable_deletion_protection = false

  tags = {
    Environment = "${var.project_name}-network-load-balancer"
  }
}