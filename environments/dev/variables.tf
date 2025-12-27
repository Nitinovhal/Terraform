variable "region" {
  type    = string
  default = "us-east-1"
}

variable "azs" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "backend_bucket" {
  type = string
}

variable "backend_dynamodb_table" {
  type = string
}

variable "ami_id" {
  type    = string
  default = "ami-0c94855ba95c71c99" # Ubuntu 20.04 LTS in us-east-1 (example)
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "db_instance_class" {
  type    = string
  default = "db.t3.micro"
}
