# Use terraform to query latest generated AMI..

data "aws_ami" "resource-ami" {
  # count = 3

  filter {
    name   = "tag:Name"
    values = [var.resource_ami_filter]
    # values = [var.resouce_ami_filter[count.index]]
  }

  filter {
    name   = "state"
    values = ["available"]
  }

  most_recent = true
  owners      = ["self"]
}

