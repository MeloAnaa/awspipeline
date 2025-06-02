
resource "aws_instance" "instancetokyo" {
  ami                         = "ami-0c02fb55956c7d316"
  associate_public_ip_address = true
  availability_zone           = "ap-northeast-1"
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
  private_ip = "172.31.40.65"
  root_block_device {
    iops        = 3000
    throughput  = 125
    volume_size = 8
    volume_type = "gp3"
  }
  security_groups = ["default"]
  subnet_id       = "subnet-12345678"
  tags = {
    Environment = "teste"
    Name        = "instancetokyo"
    Owner       = "ana"
  }
  tenancy = "default"
  # The following attributes have default values introduced when importing the resource into terraform: [timeouts]
  lifecycle {
    ignore_changes = [timeouts]
  }
}

