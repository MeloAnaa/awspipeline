resource "aws_instance" "tokyo" {
  provider                    = aws.tokyo
  ami                         = "ami-0c1638aa346a43fe8"
  instance_type               = "t2.nano"
  subnet_id                   = "subnet-0daf079f949e01bff"
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.web_sg.id]   
  tags = {
    Name        = "instancetokyo"
    Environment = "teste"
    Owner       = "ana"
  }
}

