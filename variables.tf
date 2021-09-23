## ec2 instance/module variables
variable "region" {
  default = "ca-central-1"
}

variable "profile" {
  default = "default"
}

variable "ssh_key" {
  default = "devOps-Project"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "jenkins_instance_type" {
  default = "t3.large"
}

variable "iam_role" {
  default = "ec2.py-access"
}

variable "resource_ami_filter" {
  default = "packer-ansible-ami"
  # default = ["packer-ansible-ami"]
}

variable "monitor_ami_filter" {
  default = "packer-ansible-ami"
  # default = ["packer-ansible-ami"]
}

variable "jenkins_ami_filter" {
  default = "packer-jenkins-ami"
  # default = ["packer-jenkins-ami", "packer-jenkins-ami"]
}

variable "app_ami_filter" {
  default = "packer-jenkins2-ami"
  # default = ["packer-jenkins2-ami", "packer-jenkins2-ami"]
}

variable "resource_count" {
  default = "1"
}

variable "monitor_count" {
  default = "1"
}

variable "jenkins_instance_count" {
  default = "1"
}

variable "app_instance_count" {
  default = "2"
}

variable "resource_tag_name" {
  default = "tool (ansible) server"
}

variable "monitor_tag_name" {
  default = "monitor server"
}

variable "jenkins_tag_name" {
  default = "jenkins server"
}

variable "app_tag_name" {
  default = ["dev-app server", "prod-app server"]
}

variable "resource_environment" {
  default = "project env"
}

variable "monitor_environment" {
  default = "project env"
}

variable "jenkins_environment" {
  default = "jenkins env"
  # default = ["jenkins env", "jenkins env"]
}

variable "app_environment" {
  default = ["development env", "production env"]
}

variable "resource_role" {
  default = "devops-user"
}

variable "monitor_role" {
  default = "devops-user"
}

variable "jenkins_role" {
  default = "ansible-user"
}

variable "app_role" {
  default = "jenkins-user"
}

## security group variables
variable "sg_name" {
  default = "app project"
}

variable "sg2_name" {
  default = "tool server"
}

variable "sg3_name" {
  default = "monitor server"
}

variable "httpport" {
  default = "22"
}

variable "httpport1" {
  default = "9100"
}

variable "httpport2" {
  default = "8080"
}

variable "httpport3" {
  default = "0"
}

variable "httpport4" {
  default = "9090"
}

variable "httpport5" {
  default = "9093"
}

variable "httpport6" {
  default = "3000"
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

## VPC, Subnets, Associations variables
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

