# create network LB target group with HTTP protocol (port 80)
resource "aws_lb_target_group" "network-lb-target-group" {
  name        = "${var.project_name}-network-lb-target-group"
  target_type = "instance"
  port        = 80
  protocol    = "TCP"
  deregistration_delay = 10
  vpc_id      = aws_vpc.vpc.id
  

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    timeout             = 6
    matcher             = 200
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }

  lifecycle {
    create_before_destroy = true
  }
}


  