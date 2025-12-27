variable "name" {
  type    = string
  default = "dev-app-secret"
}

variable "kms_key_id" {
  type = string
  default = null
}

variable "secret_string" {
  type    = string
  default = "{\"username\": \"app\", \"password\": \"changeme\"}"
}

resource "aws_secretsmanager_secret" "this" {
  name       = var.name
  kms_key_id = var.kms_key_id
}

resource "aws_secretsmanager_secret_version" "this" {
  secret_id     = aws_secretsmanager_secret.this.id
  secret_string = var.secret_string
}

output "secret_arn" {
  value = aws_secretsmanager_secret.this.arn
}

output "secret_id" {
  value = aws_secretsmanager_secret.this.id
}
