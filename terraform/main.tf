provider "aws" {
  region = "us-east-1" # você pode trocar pela sua região desejada
}

resource "aws_s3_bucket" "meu_bucket" {
  bucket = "meu-bucket-estagiolabana20255555" # o nome do bucket deve ser único globalmente

  acl    = "private" # acesso padrão privado
}
