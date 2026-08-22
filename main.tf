terraform {
  backend "s3" {
    bucket = "terraform-state-floci"
    key    = "terraform/terraform.tfstate"
    region = "us-east-1"

    endpoints = {
      s3 = "http://localhost:4566"
    }

    access_key = "test"
    secret_key = "test"

    skip_credentials_validation = true
    skip_requesting_account_id  = true
    skip_region_validation      = true
    skip_metadata_api_check     = true

    use_path_style = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.59"
    }
  }
}

provider "aws" {
  region     = "us-east-1"
  access_key = "test"
  secret_key = "test"

  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
  skip_region_validation      = true

  endpoints {
    s3 = "http://localhost:4566"
  }

  s3_use_path_style = true
}

resource "aws_s3_bucket" "cicd" {
  bucket = var.bucket_name

  tags = {
    Project     = var.project_name
    ManagedBy   = "Terraform"
    Environment = "Dev"
    Practice    = "GitHubWebhook"
    Branch      = "feature"
  }
}

resource "aws_s3_object" "website" {
  bucket       = aws_s3_bucket.cicd.id
  key          = "index.html"
  source       = "index.html"
  content_type = "text/html"
}