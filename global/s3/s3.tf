resource "aws_s3_bucket" "test_bucket" {
  bucket = "terraform-bukarevd"
  region = "us-east-1"

  versioning {
    enabled = true
  }
  force_destroy = true
}