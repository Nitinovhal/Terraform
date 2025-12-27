output "instance_ids" {
  value = [for i in aws_instance.app : i.id]
}

output "app_sg_id" {
  value = aws_security_group.app_sg.id
}

output "private_ips" {
  value = [for i in aws_instance.app : i.private_ip]
}
