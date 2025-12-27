# KMS module

Creates a reusable KMS customer master key and alias. Outputs `kms_key_arn` and `kms_key_id`.

Use this key to encrypt secrets and RDS storage (for dev environments, a single key is common).
