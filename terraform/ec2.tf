resource "aws_instance" "tokyo" {
  provider                    = aws.tokyo
  ami                         = "ami-0c1638aa346a43fe8"
  instance_type               = "t2.nano"
  subnet_id                   = "subnet-0daf079f949e01bff"
  security_groups             = ["default"]

  tags = {
    Name        = "instancetokyo"
    Environment = "teste"
    Owner       = "ana"
  }
}

