terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
  required_version = ">= 0.14.9"
}

resource "aws_instance" "tool-server" {
  ami             = data.aws_ami.resource-ami.id
  key_name        = var.ssh_key
  instance_type   = var.instance_type
  count           = var.resource_count
  security_groups = [aws_security_group.tool_sg.id]
  subnet_id       = aws_subnet.app_vpc_subnet[count.index].id
  user_data       = data.template_file.localpubkey_installation.template

  tags = {
    Name        = "${var.resource_tag_name}"
    environment = "${var.resource_environment}"
    role        = "${var.resource_role}"
  }
}

module "App-Project" {
  source    = "./Modules"
  count     = var.module_instance_count
  user_data = data.template_file.localpubkey_installation.template
  # ami_id      = "ami-07625b74039b1a58b"
  ami_id        = data.aws_ami.module-ami[count.index].id
  key           = var.ssh_key
  instance_type = var.instance_type
  name          = var.module_tag_name[count.index]
  environment   = var.module_environment[count.index]
  role          = var.module_role
  sg_id         = [aws_security_group.app_sg.id]
  subnet_id     = aws_subnet.app_vpc_subnet[count.index].id
}