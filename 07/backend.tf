terraform {
  backend "s3" {
    bucket = "terraform-state-jgyy"
    key    = "07/terraform.tfstate"
    region = "ap-southeast-1"
  }
}
