resource "aws_s3_bucket" "terraform_state" {
  bucket = "analabestagio2025-terraform-estado"

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }
}
