terraform {
  backend "s3" {
    bucket         = "analabestagio2025-terraform-estado"
    key            = "terraform/state.tfstate"
    region         = "us-east-1"
  }
}
