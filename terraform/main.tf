resource "aws_s3_bucket" "meu_bucket" {
  bucket = "meu-bucket-anaestagiolab202555" # Nome único globalmente
  acl    = "private"
}
