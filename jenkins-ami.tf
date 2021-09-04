# Use terraform to query latest generated AMI..

data "aws_ami" "jenkins-ami" {
  #   count = 2

  filter {
    name = "tag:Name"
    # values = [var.jenkins_ami_filter[count.index]]
    values = [var.jenkins_ami_filter]
  }

  filter {
    name   = "state"
    values = ["available"]
  }

  most_recent = true
  owners      = ["self"]
}