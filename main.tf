resource "aws_s3_bucket" "anaestagiolab2025ana" {
  bucket = "anaestagiolab2025ana"
  tags = {
    Environment = "dev"
    Name        = "anaestagiolab2025ana"
    Owner       = "ana"
    Project     = "Project"
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.anaestagiolab2025ana.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket" "anaestagiolab2025ana" {
  bucket = "anaestagiolab2025ana"
  tags = {
    Environment = "dev"
    Name        = "anaestagiolab2025ana"
    Owner       = "ana"
    Project     = "Project"
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.anaestagiolab2025ana.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket" "anaestagiolab2025ana" {
  bucket = "anaestagiolab2025ana"
  tags = {
    Environment = "dev"
    Name        = "anaestagiolab2025ana"
    Owner       = "ana"
    Project     = "Project"
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.anaestagiolab2025ana.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket" "anaestagiolab2025ana" {
  bucket = "anaestagiolab2025ana"
  tags = {
    Environment = "dev"
    Name        = "anaestagiolab2025ana"
    Owner       = "ana"
    Project     = "Project"
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.anaestagiolab2025ana.id
  versioning_configuration {
    status = "Enabled"
  }
}
