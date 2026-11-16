output "instance_id" {
  value = module.instance.instance_linux_id
}

output "instance_private_ip" {
  value = module.instance.instance_private_ip_address
}

output "instance_public_ip" {
  value = module.instance.instance_public_ip_address
}

output "instance_security_group_id" {
  value = module.instance.security_group_id
}