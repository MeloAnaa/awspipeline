resource "aws_s3_bucket" "testeanaestagioteste123" {
  provider = aws.tokyo
  bucket   = "testeanaestagioteste123"

  tags = {
    Owner = "ana"
    Name = "ana"
    Environment = "teste"
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "testeanaestagioteste123" {
  bucket = "testeanaestagioteste123"
  tags = {
    Environment = "teste"
    Name        = "ana"
    Owner       = "ana"
  }
}