resource "aws_autoscaling_group" "autoscaling-group" {
  name     = "${var.project_name}-autoscaling-group"
  min_size = 2
  max_size = 6

  health_check_type = "ELB"

  vpc_zone_identifier = [

    "${aws_subnet.public-subnets[0].id}",
    "${aws_subnet.public-subnets[1].id}"

  ]

  
  target_group_arns = [aws_lb_target_group.network-lb-target-group.arn]

  mixed_instances_policy {
    launch_template {
      launch_template_specification {
        launch_template_id = aws_launch_template.launch-template.id
      }
      
    }
  }
}

resource "aws_autoscaling_policy" "asgpolicy" {
  name                   = "${var.project_name}-asgpolicy"
  policy_type            = "TargetTrackingScaling"
  autoscaling_group_name = aws_autoscaling_group.autoscaling-group.name

  estimated_instance_warmup = 300

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    target_value = 25.0
  }
}