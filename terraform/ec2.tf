resource "aws_instance" "web_tokyo" {
  provider      = aws.tokyo
  ami           = "ami-0df99aab35564a14e" 
  instance_type = "t2.nano"

  tags = {
    Name        = "web-instance2"
    Owner       = "ana"
    Environment = "dev"
    Project     = "Project"
  }
}
