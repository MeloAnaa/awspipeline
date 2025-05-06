resource "aws_s3_bucket" "bucket_terraform" {
  bucket = "meu-bucket-unico-terraform"

  tags = {
    Owner      = "ana"
    Environment = "dev"
    Project    = "meu-projeto"
  }
}