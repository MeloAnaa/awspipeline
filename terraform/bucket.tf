resource "aws_s3_bucket" "ana_bucket" {
  bucket = "anaestagiolab2025ana"

  tags = {
    Name        = "anaestagiolab2025ana"
    Owner       = "ana"
    Environment = "dev"
    Project     = "Project"
  }
}
