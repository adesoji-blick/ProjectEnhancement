output "instance-public-ip" {
  value = aws_instance.tool-server.*.public_ip
}

# output "App-Project-Sg" {
#   value = aws_security_group.app_sg.id
# }

# output "App-vpc" {
#   value = aws_vpc.app_vpc.id
# }

# output "App-vpc-subnet" {
#   value = aws_subnet.app_vpc_subnet.*.id
# }
