# Use terraform to query latest generated AMIs..

data "aws_ami" "resource-ami" {

  filter {
    name   = "tag:Name"
    values = [var.resource_ami_filter]
  }

  filter {
    name   = "state"
    values = ["available"]
  }

  most_recent = true
  owners      = ["self"]
}

data "aws_ami" "monitor-ami" {

  filter {
    name   = "tag:Name"
    values = [var.monitor_ami_filter]
  }

  filter {
    name   = "state"
    values = ["available"]
  }

  most_recent = true
  owners      = ["self"]
}

data "aws_ami" "jenkins-ami" {

  filter {
    name   = "tag:Name"
    values = [var.jenkins_ami_filter]
  }

  filter {
    name   = "state"
    values = ["available"]
  }

  most_recent = true
  owners      = ["self"]
}

data "aws_ami" "app-ami" {

  filter {
    name   = "tag:Name"
    values = [var.app_ami_filter]
  }

  filter {
    name   = "state"
    values = ["available"]
  }

  most_recent = true
  owners      = ["self"]
}
