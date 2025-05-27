terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "analabshoppr-tfstate-bucket"     
    key            = "global/s3/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "shoppr-tfstate-locking"
    encrypt        = true
  }
}

provider "aws" {
  alias = "nv"
  region = "us-east-1"
}

provider "aws" {
  alias = "tokyo"
  region = "ap-northeast-1"
}