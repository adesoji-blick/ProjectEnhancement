source "amazon-ebs" "amazon-linux" {
  ami_name      = "java-ami"
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
    Name = "packer-java-ami"
  }
}

build {
  sources = [
    "source.amazon-ebs.amazon-linux"
  ]

  provisioner "shell" {

    inline = [
      "echo installing GIT",
      "sudo yum install git -y",
      "echo installing Java OpenJDK 11",
      "curl https://download.java.net/openjdk/jdk11/ri/openjdk-11+28_linux-x64_bin.tar.gz -O",
      "tar xvf openjdk-11*_bin.tar.gz",
      "sudo yum install java -y"
    ]
  }
}