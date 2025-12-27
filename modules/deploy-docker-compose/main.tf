variable "ami_id" { type = string }
variable "instance_type" { type = string; default = "t3.micro" }
variable "subnet_id" { type = string }
variable "key_name" { type = string; default = null }
variable "user_data" { type = string; default = <<-EOT
#!/bin/bash
set -e
apt-get update
apt-get install -y docker.io docker-compose
usermod -aG docker ubuntu || true
EOT
}

resource "aws_security_group" "app_sg" {
  name        = "dev-app-sg"
  description = "Allow traffic from ALB"
  vpc_id      = var.vpc_id
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress { from_port = 0; to_port = 0; protocol = "-1"; cidr_blocks = ["0.0.0.0/0"] }
}

resource "aws_instance" "app" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  associate_public_ip_address = false
  key_name               = var.key_name
  user_data              = var.user_data
  security_groups        = [aws_security_group.app_sg.id]
  count                  = 1
  tags = { Name = "dev-app-instance" }
}

output "instance_ids" { value = [for i in aws_instance.app : i.id] }
output "app_sg_id" { value = aws_security_group.app_sg.id }
output "private_ips" { value = [for i in aws_instance.app : i.private_ip] }
