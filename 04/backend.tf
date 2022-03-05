terraform {
  backend "s3" {
    bucket = "terraform-state-jgyy"
    key    = "terraform/04"
    region = "ap-southeast-1"
  }
}
