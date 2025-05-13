resource "aws_s3_bucket" "meu_bucket" {
  bucket = "meu-bucket-exemplo-simples-12345"
  acl    = "private"

  tags = {
    Environment = "Dev"
    Owner = "ana"
    Project = "project"
  }
}


resource "aws_s3_bucket" "meu_bucket" {
  bucket = "meu-bucket-exemplo-simples-1234909095"
  acl    = "private"

  tags = {
    Environment = "Dev"
    Owner = "ana"
    Project = "project"
  }
}
