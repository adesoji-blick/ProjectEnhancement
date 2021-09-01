source "amazon-ebs" "ansible" {
  ami_name      = "ansible-ami"
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
    Name = "packer-ansible-ami"
  }
}

build {
  sources = [
    "source.amazon-ebs.ansible"
  ]

  provisioner "file" {
    source      = "tf-packer"
    destination = "/tmp/"
  }

  provisioner "file" {
    source      = "tf-packer.pub"
    destination = "/tmp/"
  }

    provisioner "shell" {
    script = "../Scripts/ansible_admin.sh"
  }

}