#eating target group in alb
resource "aws_lb_target_group" "alb-target-group" {
  name     = "application-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vp1.id

  health_check {
    enabled             = true
    healthy_threshold   = 3
    interval            = 10
    matcher             = 200
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 6
    unhealthy_threshold = 3
  }
}

#attach the target group to our aws ec2 instance
resource "aws_lb_target_group_attachment" "attach-app1" {
  target_group_arn = aws_lb_target_group.alb-target-group.arn # recalling id from target group
  target_id        = aws_instance.belo.id  # recalling id from ec2 instance
  port             = 80
}


#attach the target group to our aws ec2 instance
resource "aws_lb_target_group_attachment" "attach-app2" {
  target_group_arn = aws_lb_target_group.alb-target-group.arn # recalling id from target group
  target_id        = aws_instance.belo2.id  # recalling id from ec2 instance
  port             = 80
}


# creating listenner

resource "aws_lb_listener" "alb-http-listener" {
    load_balancer_arn = aws_lb.application-lb.arn  # recalling id from alb 
    port              = "80"
    protocol          = "HTTP"
  
    default_action {
      type             = "forward"
      target_group_arn = aws_lb_target_group.alb-target-group.arn  # recalling id from target group
    }
  }


  # create load balancer
  resource "aws_lb" "application-lb" {
  name               = "application-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sg2.id] #recalling sg id
  subnets            = [aws_subnet.public1.id, aws_subnet.public2.id]  #recalling id of public subnet

  enable_deletion_protection = false

  tags = {
    Environment = "application-lb"
    Name        = "Application-lb"
    
  }
}