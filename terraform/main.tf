resource "aws_s3_bucket" "meu_bucket" {
  bucket = "meu-bucket-exemplo-simples-12345"
  acl    = "private"

  tags = {
    Environment = "Dev"
  }
}
