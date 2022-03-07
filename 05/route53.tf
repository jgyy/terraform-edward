resource "aws_route53_zone" "jgyynet-net" {
  name = var.DOMAIN_NAME
}

resource "aws_route53_record" "server1-record" {
  zone_id = aws_route53_zone.jgyynet-net.zone_id
  name    = "server1.${var.DOMAIN_NAME}"
  type    = "A"
  ttl     = "300"
  records = [aws_eip.nat.public_ip]
}

resource "aws_route53_record" "w3-record" {
  zone_id = aws_route53_zone.jgyynet-net.zone_id
  name    = "w3.${var.DOMAIN_NAME}"
  type    = "A"
  ttl     = "300"
  records = [aws_eip.nat.public_ip]
}

resource "aws_route53_record" "mail1-record" {
  zone_id = aws_route53_zone.jgyynet-net.zone_id
  name    = var.DOMAIN_NAME
  type    = "MX"
  ttl     = "300"
  records = [
    "1 aspmx.l.google.com.",
    "5 alt1.aspmx.l.google.com.",
    "5 alt2.aspmx.l.google.com.",
    "10 aspmx2.googlemail.com.",
    "10 aspmx3.googlemail.com.",
  ]
}

output "ns-servers" {
  value = aws_route53_zone.jgyynet-net.name_servers
}