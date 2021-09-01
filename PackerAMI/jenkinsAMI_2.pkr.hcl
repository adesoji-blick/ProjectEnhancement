source "amazon-ebs" "jenkins2" {
  ami_name      = "jenkins2-ami"
  instance_type = "t2.micro"
  region        = "ca-central-1"
  source_ami_filter {
    filters = {
      name                = "amzn2-ami-hvm-*-gp2"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["amazon"]
  }
  ssh_username = "ec2-user"

  tags = {
    Name = "packer-jenkins2-ami"
  }
}

build {
  sources = [
    "source.amazon-ebs.jenkins2"
  ]

  provisioner "file" {
    source      = "tf-packer.pub"
    destination = "/tmp/"
  }

  provisioner "shell" {
    script = "../Scripts/jenkins_client.sh"
  }

  provisioner "shell" {
    script = "../Scripts/ansible_client.sh"
  }

  provisioner "shell" {
    script = "../Scripts/java_OpenJDK11.sh"
  }
}