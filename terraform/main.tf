provider "aws" {
  region = "us-east-1"
}


locals {
  common_tags = {
    Environment = "labestagioana"
    Owner       = "ana"
    Project     = "lab"
  }
}

#  S3 para CUR
resource "aws_s3_bucket" "cur_bucket" {
  bucket = "finops-cur-bucket-demo"

  tags = local.common_tags
}

resource "aws_s3_bucket_versioning" "cur_versioning" {
  bucket = aws_s3_bucket.cur_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "cur_block" {
  bucket = aws_s3_bucket.cur_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# CUr
resource "aws_cur_report_definition" "cur" {
  report_name         = "finops-cur-report"
  time_unit           = "DAILY"
  format              = "Parquet"
  compression         = "Parquet"
  additional_schema_elements = ["RESOURCES"]
  s3_bucket           = aws_s3_bucket.cur_bucket.id
  s3_prefix           = "cur-data/"
  s3_region           = "us-east-1"
  report_versioning   = "CREATE_NEW_REPORT"

  depends_on = [aws_s3_bucket_public_access_block.cur_block]
}

# Glue database
resource "aws_glue_catalog_database" "cur_db" {
  name = "finops_cur_db"
  tags = local.common_tags
}

# Glue 
resource "aws_glue_catalog_table" "cur_table" {
  name          = "cur_table"
  database_name = aws_glue_catalog_database.cur_db.name

  table_type = "EXTERNAL_TABLE"

  storage_descriptor {
    location      = "s3://${aws_s3_bucket.cur_bucket.bucket}/cur-data/"
    input_format  = "org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat"
    output_format = "org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat"

    serde_info {
      serialization_library = "org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe"
    }

    columns {
      name = "identity_line_item_id"
      type = "string"
    }

    # outras colunas conforme o CUR
  }

  parameters = {
    classification = "parquet"
  }

  tags = local.common_tags
}
