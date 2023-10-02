/*#1. Creat s3-bucket

resource "aws_s3_bucket" "s3statebackend062023" {
  bucket = "${var.s3_prefix}-s3statebackend062023"
  
}

resource "aws_s3_bucket_versioning" "aws-s3-bucket-versioning" {
  bucket = "${var.s3_prefix}-s3statebackend062023"
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "aws-s3bucket-server-side-encryption-configuration" {
  bucket = "${var.s3_prefix}-s3statebackend062023"

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "AES256"
    }
  }
}
