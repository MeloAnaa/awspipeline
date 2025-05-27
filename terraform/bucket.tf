resource "aws_s3_bucket" "testeanaestagioteste123" {
  provider = aws.tokyo
  bucket   = "testeanaestagioteste123"

  tags = {
    Owner = "ana"
  }
}
