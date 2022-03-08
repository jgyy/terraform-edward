resource "aws_instance" "jenkins-instance" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.small"

  # the VPC subnet
  subnet_id = aws_subnet.main-public-1.id

  # the security group
  vpc_security_group_ids = [aws_security_group.jenkins-securitygroup.id]

  # the public SSH key
  key_name = aws_key_pair.mykeypair.key_name

  # user data
  user_data = templatefile("scripts/jenkins-init.sh", {
    DEVICE          = var.INSTANCE_DEVICE_NAME
    JENKINS_VERSION = var.JENKINS_VERSION
  })
}

resource "aws_ebs_volume" "jenkins-data" {
  availability_zone = "${var.AWS_REGION}a"
  size              = 20
  type              = "gp2"
  tags = {
    Name = "jenkins-data"
  }
}

resource "aws_volume_attachment" "jenkins-data-attachment" {
  device_name = var.INSTANCE_DEVICE_NAME
  volume_id   = aws_ebs_volume.jenkins-data.id
  instance_id = aws_instance.jenkins-instance.id
}
