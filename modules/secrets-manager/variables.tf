variable "name" {
  description = "Secrets Manager secret name"
  type        = string
  default     = "dev-app-secret"
}

variable "kms_key_id" {
  description = "KMS key id or ARN for encryption"
  type        = string
  default     = null
}

variable "secret_string" {
  description = "JSON string for initial secret value"
  type        = string
  default     = "{\"username\": \"app\", \"password\": \"changeme\"}"
}
