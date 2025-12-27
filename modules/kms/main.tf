variable "description" {
  type    = string
  default = "dev KMS key"
}

resource "aws_kms_key" "this" {
  description = var.description
  deletion_window_in_days = 30
  tags = { Name = "dev-kms" }
}

resource "aws_kms_alias" "alias" {
  name          = "alias/dev-kms"
  target_key_id = aws_kms_key.this.id
}
