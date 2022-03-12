resource "aws_s3_bucket" "codebuild-cache" {
  bucket = "demo-codebuild-cache-${random_string.random.result}"
}

resource "aws_s3_bucket" "demo-artifacts" {
  bucket = "demo-artifacts-${random_string.random.result}"
}

resource "random_string" "random" {
  length  = 8
  special = false
  upper   = false
}
