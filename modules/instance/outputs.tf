output "security_group_id" {
  value = aws_security_group.instance_sg.id
}

output "instance_linux_id" {
  value = aws_instance.instance.id
}

output "instance_private_ip_address" {
  value = aws_instance.instance.private_ip
}

output "instance_public_ip_address" {
  value = aws_instance.instance.public_ip
}