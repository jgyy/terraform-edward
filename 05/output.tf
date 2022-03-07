output "instance" {
  value = aws_instance.example.public_ip
}

output "rds" {
  value = aws_db_instance.mariadb.endpoint
}

output "eb" {
  value = aws_elastic_beanstalk_environment.app-prod.cname
}

output "ELB" {
  value = aws_elb.my-elb.dns_name
}
