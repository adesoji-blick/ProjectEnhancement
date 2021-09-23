# Provisioning Tools Security Group

resource "aws_security_group" "tool_sg" {
  name = "${var.sg2_name}-Sg"
  # vpc_id = var.vpc_id
  vpc_id = aws_vpc.app_vpc.id

  ingress {
    from_port   = var.httpport
    to_port     = var.httpport
    protocol    = var.ingress_protocol
    cidr_blocks = var.sg_cidr_block
  }

  ingress {
    from_port   = var.httpport1
    to_port     = var.httpport1
    protocol    = var.ingress_protocol
    cidr_blocks = var.sg_cidr_block
  }

  egress {
    from_port   = var.httpport3
    to_port     = var.httpport3
    protocol    = var.egress_protocol
    cidr_blocks = var.sg_cidr_block
  }

  tags = {
    Name = "${var.sg2_name}"
  }
}

# Provisioning Apps Security Group
resource "aws_security_group" "app_sg" {
  name = "${var.sg_name}-Sg"
  # vpc_id = var.vpc_id
  vpc_id = aws_vpc.app_vpc.id

  ingress {
    from_port   = var.httpport
    to_port     = var.httpport
    protocol    = var.ingress_protocol
    cidr_blocks = var.sg_cidr_block
  }

  ingress {
    from_port   = var.httpport1
    to_port     = var.httpport1
    protocol    = var.ingress_protocol
    cidr_blocks = var.sg_cidr_block
  }

  ingress {
    from_port   = var.httpport2
    to_port     = var.httpport2
    protocol    = var.ingress_protocol
    cidr_blocks = var.sg_cidr_block
  }

  egress {
    from_port   = var.httpport3
    to_port     = var.httpport3
    protocol    = var.egress_protocol
    cidr_blocks = var.sg_cidr_block
  }

  tags = {
    Name = "${var.sg_name}"
  }
}

# Provisioning Monitoring Security Group

resource "aws_security_group" "monitor_sg" {
  name = "${var.sg3_name}-Sg"
  # vpc_id = var.vpc_id
  vpc_id = aws_vpc.app_vpc.id

  ingress {
    from_port   = var.httpport
    to_port     = var.httpport
    protocol    = var.ingress_protocol
    cidr_blocks = var.sg_cidr_block
  }

  ingress {
    from_port   = var.httpport1
    to_port     = var.httpport1
    protocol    = var.ingress_protocol
    cidr_blocks = var.sg_cidr_block
  }

  ingress {
    from_port   = var.httpport4
    to_port     = var.httpport4
    protocol    = var.ingress_protocol
    cidr_blocks = var.sg_cidr_block
  }

  ingress {
    from_port   = var.httpport5
    to_port     = var.httpport5
    protocol    = var.ingress_protocol
    cidr_blocks = var.sg_cidr_block
  }

  ingress {
    from_port   = var.httpport6
    to_port     = var.httpport6
    protocol    = var.ingress_protocol
    cidr_blocks = var.sg_cidr_block
  }

  egress {
    from_port   = var.httpport3
    to_port     = var.httpport3
    protocol    = var.egress_protocol
    cidr_blocks = var.sg_cidr_block
  }

  tags = {
    Name = "${var.sg3_name}"
  }
}