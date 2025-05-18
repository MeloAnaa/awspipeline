resource "aws_instance" "web" {
  ami                    = "ami-0953476d60561c955"
  instance_type          = "t2.nano"
  subnet_id              = "subnet-0daf079f949e01bff"
  vpc_security_group_ids = [aws_security_group.web_sg.id]  

  tags = {
    Name        = "web-instance"
    Owner       = "ana"
    Environment = "dev"
    Project     = "Project"
  }
}


resource "aws_security_group" "web_sg" {
  name        = "web_sg"
  description = "Allow SSH ingress and all egress"
  vpc_id      = "vpc-0ac9b054c0e7ec98b"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    self        = false
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    self        = false
  }

  lifecycle {
    ignore_changes = [revoke_rules_on_delete, timeouts]
  }
}





resource "aws_lb" "web_alb" {
  name               = "web-alb"
  internal           = false
  load_balancer_type = "application"
  subnets            = ["subnet-0daf079f949e01bff", "subnet-090eb77b6e57cfe74"]
  security_groups    = [aws_security_group.web_sg.id]  # Corrigido para usar web_sg
}

resource "aws_lb_target_group" "web_tg" {
  name     = "web-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "vpc-0ac9b054c0e7ec98b"
}

resource "aws_lb_listener" "web_listener" {
  load_balancer_arn = aws_lb.web_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web_tg.arn
  }
}

resource "aws_lb_target_group_attachment" "web_attachment" {
  target_group_arn = aws_lb_target_group.web_tg.arn
  target_id        = aws_instance.web.id
  port             = 80
}



resource "aws_s3_bucket" "anaestagiolab2025ana" {
  bucket = "anaestagiolab2025ana"
  tags = {
    Environment = "dev"
    Name        = "anaestagiolab2025ana"
    Owner       = "ana"
    Project     = "Project"
  }
}


