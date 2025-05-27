resource "aws_instance" "web_tokyo" {
  provider      = aws.tokyo
  ami           = "ami-0953476d60561c955" 
  instance_type = "t2.nano"

  tags = {
    Name        = "web-instance2"
    Owner       = "ana"
    Environment = "dev"
    Project     = "Project"
  }
}
