provider "aws" {
  profile = "jgyy"
  region  = "ap-southeast-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0abb8f6b71e7614d5"
  instance_type = "t2.micro"
}
