variable "AWS_REGION" {
  type    = string
  default = "ap-southeast-1"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "/tmp/mykey"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "/tmp/mykey.pub"
}

variable "ENV" {
  default = "prod"
}

variable "project_tags" {
  type = map(string)
  default = {
    Component   = "Frontend"
    Environment = "Production"
  }
}

variable "ports_number" {
  type    = list(number)
  default = [22, 443, 80, 81, 8080]
}

variable "ports_string" {
  type = map(list(string))
  default = {
    "22" = [ "127.0.0.1/32", "192.168.0.0/24" ]
    "443" = [ "0.0.0.0/0" ]
  }
}