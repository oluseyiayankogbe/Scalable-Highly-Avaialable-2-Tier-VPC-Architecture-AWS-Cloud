# create network lb listener on port 80 with forward action
resource "aws_lb_listener" "network-lb-tcp-listener" {
  load_balancer_arn = aws_lb.network-load-balancer.arn
  port              = 80
  protocol          = "TCP"

   default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.network-lb-target-group.arn
  }
} 


