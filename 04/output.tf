output "ubuntu_ip" {
  value = aws_instance.ubuntu.public_ip
}

output "windows_ip" {
  value = aws_instance.windows.public_ip
}
