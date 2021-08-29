output "module-public-ip" {
  value = aws_instance.ec2_module.*.public_ip
}
