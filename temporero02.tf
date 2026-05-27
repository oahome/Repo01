provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "bucket_vulnerable" {
  bucket = "mi-bucket-de-prueba-xsiam-12345"
}

# ERROR 1: Hace el bucket totalmente público en internet
resource "aws_s3_bucket_public_access_block" "publico" {
  bucket = aws_s3_bucket.bucket_vulnerable.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# ERROR 2: Desactiva el cifrado de datos en reposo
resource "aws_s3_bucket_server_side_encryption_configuration" "sin_cifrar" {
  bucket = aws_s3_bucket.bucket_vulnerable.id

  rule {
    bucket_key_enabled = false
  }
}