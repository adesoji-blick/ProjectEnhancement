# Use terraform to query latest generated AMI..

data "aws_ami" "app-ami" {
  # count = 2

  filter {
    name = "tag:Name"
    # values = [var.app_ami_filter[count.index]]
    values = [var.app_ami_filter]
  }

  filter {
    name   = "state"
    values = ["available"]
  }

  most_recent = true
  owners      = ["self"]
}