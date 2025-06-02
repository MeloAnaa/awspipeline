
resource "aws_instance" "tokyo" {
  ami                         = "ami-0dfa0840de3c2c70a"
  associate_public_ip_address = true
  availability_zone           = "ap-northeast-1a"
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
  private_ip = "172.31.40.65"
  root_block_device {
    iops        = 3000
    throughput  = 125
    volume_size = 8
    volume_type = "gp3"
  }
  security_groups = ["default"]
  subnet_id       = "subnet-0daf079f949e01bff"
  tags = {
    Name        = "instancetokyo"
    Owner       = "ana"
    Environment = "teste"
  }
  tenancy = "default"
  # The following attributes have default values introduced when importing the resource into terraform: [timeouts]
  lifecycle {
    ignore_changes = [timeouts]
  }
}

