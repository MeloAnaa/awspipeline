provider "aws" {
  region = "us-east-1"
}

# S3 Bucket para armazenar os relatórios CUR
resource "aws_s3_bucket" "cur_bucket" {
  bucket = "finopscurbucketdemoanaalab202555"  # Certifique-se de que seja único globalmente

  tags = {
    Environment = "labestagioana"
    Owner       = "ana"
    Project     = "lab"
  }
}

resource "aws_s3_bucket_versioning" "cur_versioning" {
  bucket = aws_s3_bucket.cur_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "cur_block" {
  bucket                  = aws_s3_bucket.cur_bucket.id
  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_policy" "cur_bucket_policy" {
  bucket = aws_s3_bucket.cur_bucket.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid       = "AWSBillingPermissions",
        Effect    = "Allow",
        Principal = { Service = "billingreports.amazonaws.com" },
        Action    = "s3:GetBucketAcl",
        Resource  = aws_s3_bucket.cur_bucket.arn
      },
      {
        Sid       = "AWSBillingPermissions2",
        Effect    = "Allow",
        Principal = { Service = "billingreports.amazonaws.com" },
        Action    = "s3:PutObject",
        Resource  = "${aws_s3_bucket.cur_bucket.arn}/cur-data/*"
      }
    ]
  })
}

# Glue Database
resource "aws_glue_catalog_database" "cur_db" {
  name = "finops_cur_db"

  tags = {
    Environment = "labestagioana"
    Owner       = "ana"
    Project     = "lab"
  }
}

# Glue Table
resource "aws_glue_catalog_table" "cur_table" {
  name          = "cur_table"
  database_name = aws_glue_catalog_database.cur_db.name
  table_type    = "EXTERNAL_TABLE"

  parameters = {
    classification = "parquet"
  }

  storage_descriptor {
    location      = "s3://${aws_s3_bucket.cur_bucket.bucket}/cur-data/"
    input_format  = "org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat"
    output_format = "org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat"

    columns {
      name = "identity_line_item_id"
      type = "string"
    }

    ser_de_info {
      serialization_library = "org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe"
    }
  }
}

# CUR Report Definition
resource "aws_cur_report_definition" "cur" {
  report_name                = "finops-cur-report"
  time_unit                  = "DAILY"
  format                     = "Parquet"
  compression                = "Parquet"
  additional_schema_elements = ["RESOURCES"]
  s3_bucket                  = aws_s3_bucket.cur_bucket.bucket
  s3_prefix                  = "cur-data/"
  s3_region                  = "us-east-1"
  report_versioning          = "CREATE_NEW_REPORT"
  refresh_closed_reports     = true
}
