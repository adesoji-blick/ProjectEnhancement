## creating ec2 instance from module resource #

resource "aws_instance" "ec2_module" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  key_name        = var.key
  user_data       = var.user_data
  security_groups = var.sg_id
  subnet_id       = var.subnet_id

  tags = {
    Name        = "${var.name}"
    environment = "${var.environment}"
    role        = "${var.role}"
  }
}
