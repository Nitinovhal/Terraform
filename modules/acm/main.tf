variable "domain_name" { type = string }
variable "validation_zone_id" { type = string }

resource "aws_acm_certificate" "this" {
  domain_name               = var.domain_name
  validation_method         = "DNS"
  lifecycle {
    create_before_destroy = true
  }
}

# NOTE: DNS validation via Route53 is handled in environments or higher-level code.
output "certificate_arn" { value = aws_acm_certificate.this.arn }
