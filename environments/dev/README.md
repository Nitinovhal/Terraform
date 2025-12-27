# Dev environment

Usage:

1. Create an S3 bucket and DynamoDB table for remote state (or use an existing one).
2. Update `terraform.tfvars` with `backend_bucket` and `backend_dynamodb_table`.
3. Run:

```powershell
terraform init
terraform plan -var-file=terraform.tfvars
terraform apply -var-file=terraform.tfvars
```

Notes:
- This is a minimal dev setup. Review resources and change secrets/credentials before using in production.
- Replace example AMI with a recent region-appropriate AMI.
