resource "random_id" "bucket_id" {
  byte_length = 4
}

resource "aws_s3_bucket" "bucket" {
  bucket        = "my-project1-static-bucket-${random_id.bucket_id.hex}"
  force_destroy = true

  tags = {
    Name = "project1-bucket"
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}
