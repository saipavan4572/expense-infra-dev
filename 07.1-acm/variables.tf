variable "project_name" {
    default = "expense"
}

variable "environment" {
    default = "dev"
}

variable "common_tags" {
    default = {
        Project = "expense"
        Environment = "dev"
        Terraform = "true"
        Component = "acm"
    }
}

variable "zone_name" {
  default = "pspkdevops.online"
}

variable "zone_id" {
  default = "Z093373829N4OKOHIDM5S"     ## Hosted zone id of Route53 hosted zone(pspkdevops.online)
}