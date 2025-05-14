
# Bucket S3 com política de ciclo de vida (FinOps: armazenamento econômico)
resource "aws_s3_bucket" "static_files" {
  bucket = "project-dev-bucket"

  tags = {
    Owner       = "ana"
    Environment = "dev"
    Project     = "Project"
  }

  lifecycle_rule {
    id      = "expire-old-objects"
    enabled = true

    expiration {
      days = 30
    }
  }
}

# Instância EC2 econômica (FinOps: uso de instância ARM t4g.nano)
resource "aws_instance" "web" {
  ami           = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 (ARM64)
  instance_type = "t4g.nano"

  tags = {
    Name        = "web-instance"
    Owner       = "ana"
    Environment = "dev"
    Project     = "Project"
  }
}

# Alarme de custo com CloudWatch (FinOps: visibilidade de custos)
resource "aws_cloudwatch_metric_alarm" "budget_alert" {
  alarm_name          = "high-cost-alert"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "EstimatedCharges"
  namespace           = "AWS/Billing"
  period              = 21600
  statistic           = "Maximum"
  threshold           = 10.00
  alarm_description   = "Alerta quando custo estimado ultrapassa $10"
  actions_enabled     = false # Pode adicionar SNS para alertar

  dimensions = {
    Currency = "USD"
  }

  tags = {
    Owner       = "ana"
    Environment = "dev"
    Project     = "Project"
  }
}
