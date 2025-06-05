resource "aws_instance" "tokyo" {
  provider                    = aws.us-east-1
  ami                         = "ami-0c1638aa346a43fe8"
  instance_type               = "t2.nano"
  subnet_id                   = "subnet-01a2eb5d053121039"
  associate_public_ip_address = true
  vpc_security_group_ids      = ["sg-05762876a285af701"]   
  tags = {
    Name        = "instancetokyo"
    Owner       = "ana"
    Environment = "teste"
  }
}


resource "aws_instance" "instancetokyo" {
  ami                         = "ami-0c02fb55956c7d316"
  associate_public_ip_address = true
  availability_zone           = "us-east-1a"
  cpu_core_count              = 1
  cpu_threads_per_core        = 1
  credit_specification {
    cpu_credits = "standard"
  }
  disable_api_termination = false
  ebs_optimized           = false
  enclave_options {
    enabled = false
  }
  hibernation                          = false
  instance_initiated_shutdown_behavior = "stop"
  instance_type                        = "t2.nano"
  metadata_options {
    http_put_response_hop_limit = 2
    http_tokens                 = "required"
  }
  monitoring = false
  root_block_device {
    iops        = 3000
    throughput  = 125
    volume_size = 8
    volume_type = "gp3"
  }
  security_groups = ["default"]
  tags = {
    Environment = "teste"
    Name        = "instancetokyo"
    Owner       = "ana"
  }
  tenancy = "default"
  lifecycle {
    ignore_changes = [timeouts]
  }
}