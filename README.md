# Terraform sample project

This repository is a sample Terraform project with reusable modules and an `environments/dev` wiring.

Defaults used in this sample:
- AWS region: `us-east-1`
- AZs: 3 (dev sample)
- RDS engine: Postgres (single-AZ dev instance)
- App servers: EC2 instances running Docker & Docker Compose (private behind ALB)

Structure:
- `modules/` - reusable modules (vpc, kms, secrets-manager, rds, deploy-docker-compose, lb, acm, route53)
- `environments/dev/` - dev-specific wiring and remote backend config

See `environments/dev/README.md` for usage and how to initialize remote state.
