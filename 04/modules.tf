module "consul" {
  source   = "github.com/jgyy/terraform-consul-module.git"
  key_name = aws_key_pair.mykey.key_name
  key_path = var.PATH_TO_PRIVATE_KEY
  vpc_id   = aws_vpc.main.id
  subnets = {
    "0" = aws_subnet.main-public-1.id
    "1" = aws_subnet.main-public-2.id
    "2" = aws_subnet.main-public-3.id
  }
}

output "consul-output" {
  value = module.consul.server_address
}
