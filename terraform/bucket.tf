provider "aws" {
  region = "ap-northeast-1"
}

resource "aws_s3_bucket" "testeanaestagioteste123" {
  bucket = "testeanaestagioteste123"
}