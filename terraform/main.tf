resource "aws_s3_bucket" "bucket_terraform" {
  bucket = "meu-bucket-unico-terraformlabestagio1"

  tags = {
    Owner      = "ana"
    Environment = "dev"
    Project    = "meu-projeto"
  }
}