provider "aws" {
  region = "ap-northeast-1"
}

resource "aws_instance" "tokyo" {
  ami           = "ami-0c1638aa346a43fe8"
  instance_type = "t2.nano"
  subnet_id     = "subnet-0daf079f949e01bff"
  associate_public_ip_address = true
  security_groups = ["default"]

  root_block_device {
    volume_type = "gp3"
    volume_size = 8
  }

  tags = {
    Name = "instancetokyo"
    Owner = "ana"
    Environment = "teste"
  }
}
