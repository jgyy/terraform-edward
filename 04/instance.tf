resource "aws_instance" "ubuntu" {
  ami                    = lookup(var.UBUNTU_AMIS, var.AWS_REGION)
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.mykey.key_name
  subnet_id              = aws_subnet.main-public-1.id

  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "sudo /tmp/script.sh"
    ]
  }
  provisioner "local-exec" {
    command = "echo ubuntu ip ${aws_instance.ubuntu.private_ip} >> private_ips.txt"
  }
  connection {
    host        = self.public_ip
    user        = var.INSTANCE_USERNAME
    private_key = file(var.PATH_TO_PRIVATE_KEY)
  }
}

resource "aws_ebs_volume" "ebs-volume-1" {
  availability_zone = "${var.AWS_REGION}a"
  size              = 20
  type              = "gp2"
  tags = {
    Name = "extra volume data"
  }
}

resource "aws_volume_attachment" "ebs-volume-1-attachment" {
  device_name = "/dev/xvdh"
  volume_id   = aws_ebs_volume.ebs-volume-1.id
  instance_id = aws_instance.ubuntu.id
}

resource "aws_instance" "windows" {
  ami           = lookup(var.WINDOWS_AMIS, var.AWS_REGION)
  instance_type = "t2.micro"
  key_name      = aws_key_pair.mykey.key_name
  user_data     = <<EOF
<powershell>
net user ${var.INSTANCE_USERNAME} '${var.INSTANCE_PASSWORD}' /add /y
net localgroup administrators ${var.INSTANCE_USERNAME} /add

winrm quickconfig -q
winrm set winrm/config/winrs '@{MaxMemoryPerShellMB="300"}'
winrm set winrm/config '@{MaxTimeoutms="1800000"}'
winrm set winrm/config/service '@{AllowUnencrypted="true"}'
winrm set winrm/config/service/auth '@{Basic="true"}'

netsh advfirewall firewall add rule name="WinRM 5985" protocol=TCP dir=in localport=5985 action=allow
netsh advfirewall firewall add rule name="WinRM 5986" protocol=TCP dir=in localport=5986 action=allow

net stop winrm
sc.exe config winrm start=auto
net start winrm
</powershell>
EOF

  provisioner "file" {
    source      = "test.txt"
    destination = "C:/test.txt"
  }
  provisioner "local-exec" {
    command = "echo windows ip ${aws_instance.windows.private_ip} >> private_ips.txt"
  }
  connection {
    host     = self.public_ip
    type     = "winrm"
    user     = var.INSTANCE_USERNAME
    password = var.INSTANCE_PASSWORD
  }
}
