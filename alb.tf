resource "aws_alb" "loylogic-ext-lb" {
  name = format("%s-%s-load-balancer", var.dns_name, var.account_environment)
  internal = false
  load_balancer_type = "application"
  subnets = ["${aws_subnet.public-subnet-1.id}","${aws_subnet.public-subnet-2.id}"]
  security_groups = [
    aws_security_group.loylogic-ext-alb-sg.id
  ]
  tags = {
    Name = format("%s-%s-load-balancer", var.dns_name, var.account_environment) 
  }
}

resource "aws_alb_target_group" "loylogic-docker-tg-1" {
  name     = format("%s-%s-docker-tg-1", var.dns_name, var.account_environment)
  port     = 80
  protocol = "HTTP"
  target_type = "instance"
  vpc_id   = "${aws_vpc.main.id}"

  health_check {
    path = "/"
    matcher = "200"
  }
  tags = {
    Name = format("%s-%s-docker-tg-1", var.dns_name, var.account_environment) 
  }
}

resource "aws_lb_target_group_attachment" "tg-1-attachment" {
  target_group_arn = aws_alb_target_group.loylogic-docker-tg-1.arn
  target_id        = aws_instance.docker-instance-1.id
  port             = 80
}

resource "aws_alb_target_group" "loylogic-docker-tg-2" {
  name     = format("%s-%s-docker-tg-2", var.dns_name, var.account_environment)
  port     = 8080
  protocol = "HTTP"
  target_type = "instance"
  vpc_id   = "${aws_vpc.main.id}" 

  health_check {
    path = "/"
    matcher = "200"
  }
  tags = {
    Name = format("%s-%s-docker-tg-2", var.dns_name, var.account_environment)
  }
}

resource "aws_lb_target_group_attachment" "tg-2-attachment" {
  target_group_arn = aws_alb_target_group.loylogic-docker-tg-2.arn
  target_id        = aws_instance.docker-instance-2.id
  port             = 8080
}


resource "aws_alb_listener" "loydlogic-alb-listener-80" {
  load_balancer_arn = aws_alb.loylogic-ext-lb.arn
  port = "80"
  protocol = "HTTP"
  default_action {
     type             = "forward"
     target_group_arn = aws_alb_target_group.loylogic-docker-tg-1.arn 
}
  }

resource "aws_alb_listener" "loydlogic-alb-listener-8080" {
  load_balancer_arn = aws_alb.loylogic-ext-lb.arn
  port = "8080"
  protocol = "HTTP"
  default_action {
     type             = "forward"
     target_group_arn = aws_alb_target_group.loylogic-docker-tg-2.arn
}
  }
