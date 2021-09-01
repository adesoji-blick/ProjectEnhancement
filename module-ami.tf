# Use terraform to query latest generated AMI..

data "aws_ami" "module-ami" {
  count = 3

  filter {
    name   = "tag:Name"
    values = [var.module_ami_filter[count.index]]
    # values = [var.module_ami_filter]
  }

  filter {
    name   = "state"
    values = ["available"]
  }

  most_recent = true
  owners      = ["self"]
}