variable "region" {
  default = "ca-central-1"
}

variable "profile" {
  default = "default"
}

variable "ami_filter" {
  default = "packer-java-ami"
  # default = ["packer-amazon-linux-ami1", "packer-amazon-linux-ami2", "packer-ubuntu-ami"]
}

variable "ssh_key" {
  default = "devOps-Project"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "resource_count" {
  default = "1"
}

variable "resource_tag_name" {
  default = "Tool (Ansible) Server"
}

variable "resource_environment" {
  default = "Project Env"
}

variable "resource_role" {
  default = "Devops-user"
}

variable "module_instance_count" {
  default = "3"
}

variable "module_tag_name" {
  default = ["Jenkins server", "Dev-App server", "Prod-App server"]
}

variable "module_environment" {
  default = ["Project Env", "Development Env", "Production Env"]
}

variable "module_role" {
  default = "Ansible-user"
}

variable "sg_name" {
  default = "App Project"
}

variable "httpport" {
  default = "22"
}

variable "httpport2" {
  default = "8080"
}

variable "httpport3" {
  default = "0"
}

# variable "port_id" {
#   default = ["80", "80", "8080"]
# }

variable "ingress_protocol" {
  default = "tcp"
}

variable "egress_protocol" {
  default = "-1"
}

variable "sg_cidr_block" {
  default = ["0.0.0.0/0"]
}

variable "vpc_name" {
  default = "App_Vpc"
}

variable "vpc_id" {
  default = "aws_vpc.app_vpc.id"
}

variable "network_instance_count" {
  default = "3"
}

variable "vpc_cidr_block" {
  default = "10.0.0.0/16"
}

variable "subnet_cidr_block" {
  default = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
}

variable "availability_zone" {
  default = ["ca-central-1a", "ca-central-1b", "ca-central-1a"]
}

variable "map_public_ip" {
  default = "true"
}

variable "rt_cidr_block" {
  default = "0.0.0.0/0"
}

