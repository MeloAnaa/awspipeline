resource "aws_s3_bucket" "testeanaestagioteste123" {
  bucket   = "testeanaestagioteste123"

  tags = {
    Owner       = "ana"
    Name        = "ana"
    Environment = "teste"
  }
}

