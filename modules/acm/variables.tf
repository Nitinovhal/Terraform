variable "domain_name" { description = "Domain to request cert for"; type = string }
variable "validation_zone_id" { description = "Route53 hosted zone id for DNS validation"; type = string; default = null }
