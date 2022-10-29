resource "aws_lb_target_group" "main" {
  name     = replace(local.name, "rtype", "tg")
  port     = var.app_port
  protocol = "HTTP"
  vpc_id   = var.vpc_dev
  health_check {
    path = "/"
    port = var.app_port
  }
  tags = {
    Name = replace(local.name, "rtype", "tg")
  }
}

resource "aws_lb" "main" {
  name               = replace(local.name, "rtype", "alb")
  internal           = false //means public 
  load_balancer_type = "application"
  security_groups    = [aws_security_group.main.id]
  subnet_mapping {
    subnet_id = data.aws_subnet.subnet_dev[0].id
  }
   subnet_mapping {
    subnet_id = data.aws_subnet.subnet_dev[4].id
  }
   subnet_mapping {
    subnet_id = data.aws_subnet.subnet_dev[2].id
  }
  tags = {
    Name = replace(local.name, "rtype", "alb")
  }
}
resource "aws_lb_listener" "main" {
  load_balancer_arn = aws_lb.main.arn
  port              = var.app_port
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.main.arn
  }
}
resource "aws_autoscaling_attachment" "asg_attachment" {
  autoscaling_group_name = data.aws_autoscaling_group.asg_dev.id
  lb_target_group_arn = aws_lb_target_group.main.arn
}