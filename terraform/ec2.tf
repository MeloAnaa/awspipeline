resource "aws_instance" "web_tokyo" {
  provider      = aws.tokyo
  ami           = "ami-0c1638aa346a43fe8" 
  instance_type = "t2.micro"

  tags = {
    Name        = "web-instance2"
    Owner       = "ana"
  }
}
