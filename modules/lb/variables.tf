variable "name" { description = "Name prefix"; type = string; default = "dev" }
variable "subnet_ids" { description = "Subnets for LB"; type = list(string) }
variable "security_groups" { description = "Security groups for LB"; type = list(string); default = [] }
variable "vpc_id" { description = "VPC id"; type = string }
