variable "ami_id" {
  description = "AMI id for instances"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "subnet_id" {
  description = "Subnet id to launch instance into"
  type        = string
}

variable "vpc_id" {
  description = "VPC id for security group"
  type        = string
}

variable "key_name" {
  description = "Optional SSH key name"
  type        = string
  default     = null
}

variable "user_data" {
  description = "User data script to provision docker"
  type        = string
  default     = ""
}
