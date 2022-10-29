resource "aws_autoscaling_group" "main" {
  name                      = replace(local.name, "rtype", "asg")
  max_size                  = var.max_size
  min_size                  = var.min_size
  health_check_grace_period = 60
  health_check_type         = "EC2"
  desired_capacity          = var.desired_capacity
  force_delete              = var.force_delete
  launch_configuration      = aws_launch_configuration.lc.name
  vpc_zone_identifier       = data.aws_subnets.subnets.ids

  // This can be useful when a configuration change requires you to replace instances. 
  // if there is instance_refresh u definitely need lifecycle
  instance_refresh {
    strategy = "Rolling"
    preferences {
      min_healthy_percentage = 50
    }
    triggers = ["tag"]
  }
  lifecycle {
    create_before_destroy = true
  }
}