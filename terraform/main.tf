resource "aws_s3_bucket" "meu_bucket" {
  "acl": "private",
  "bucket": "testandobuckets3ananana",
  "force_destroy": false,
  "tags": {
    "Environment": "Dev",
    "Owner": "ana",
    "Project": "project"
  },
  "tags_all": {
    "Environment": "Dev",
    "Owner": "ana",
    "Project": "project"
  },
  "timeouts": null
}


