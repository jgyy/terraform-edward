resource "aws_instance" "example" {
  ami           = var.AMI_ID
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = aws_subnet.main-public-1.id

  # the security group
  vpc_security_group_ids = [aws_security_group.example-instance.id]

  # the public SSH key
  key_name = aws_key_pair.mykeypair.key_name
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "jenkins-instance" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.small"

  # the VPC subnet
  subnet_id = aws_subnet.main-public-1.id

  # the security group
  vpc_security_group_ids = [aws_security_group.jenkins-securitygroup.id]

  # the public SSH key
  key_name = aws_key_pair.mykeypair.key_name

  # user data
  user_data = templatefile("scripts/jenkins-init.sh", {
    DEVICE            = var.INSTANCE_DEVICE_NAME
    JENKINS_VERSION   = var.JENKINS_VERSION
    TERRAFORM_VERSION = var.TERRAFORM_VERSION
  })

  # iam instance profile
  iam_instance_profile = aws_iam_instance_profile.jenkins-role.name
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
  device_name  = var.INSTANCE_DEVICE_NAME
  volume_id    = aws_ebs_volume.jenkins-data.id
  instance_id  = aws_instance.jenkins-instance.id
  skip_destroy = true
}

resource "aws_instance" "app-instance" {
  count         = var.APP_INSTANCE_COUNT
  ami           = var.AMI_ID
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = aws_subnet.main-public-1.id

  # the security group
  vpc_security_group_ids = [aws_security_group.app-securitygroup.id]

  # the public SSH key
  key_name = aws_key_pair.mykeypair.key_name
}
