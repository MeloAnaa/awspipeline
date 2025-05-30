resource "aws_instance" "web_tokyo" {
  provider      = aws.tokyo
  ami           = "ami-0c1638aa346a43fe8" 
  instance_type = "t2.nano"

  tags = {
    Name        = "instancetokyo"
    Owner       = "ana"
    Environment = "teste"
  }
}

