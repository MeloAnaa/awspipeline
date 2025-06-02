resource "aws_instance" "tokyo" {
  ami                         = "ami-0c1638aa346a43fe8"
  instance_type               = "t2.nano"
  availability_zone           = "ap-northeast-1a"
  subnet_id                   = "subnet-0daf079f949e01bff"
  security_groups             = ["default"]
  associate_public_ip_address = true

  root_block_device {
    volume_type  = "gp3"
    volume_size  = 8
    iops         = 3000
    throughput   = 125
    delete_on_termination = true
  }

  metadata_options {
    http_tokens                 = "required"
    http_put_response_hop_limit = 2
  }

  credit_specification {
    cpu_credits = "standard"
  }

  enclave_options {
    enabled = false
  }

  instance_initiated_shutdown_behavior = "stop"

  tags = {
    Name        = "instancetokyo"
    Owner       = "ana"
    Environment = "teste"
  }

  lifecycle {
    ignore_changes = [timeouts]
  }
}
