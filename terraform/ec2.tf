resource "aws_instance" "tokyo" {
  provider                    = aws.tokyo
  ami                         = "ami-0c1638aa346a43fe8"
  instance_type               = "t2.nano"
  subnet_id                   = "subnet-01a2eb5d053121039"
  associate_public_ip_address = true
  vpc_security_group_ids      = ["sg-05762876a285af701"]   
  tags = {
    Name        = "instancetokyo"
    Owner       = "ana"
  }
}



