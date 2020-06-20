variable "region" {
    default = "us-east-1"
}

variable "owner_vpc_id" {
}
variable "accepter_vpc_id"{
}
variable "var_accepter_profile" {
    default = "accepter"
}

variable "enabled" {
  default     = "true"
  description = "Set to false to prevent the module from creating or accessing any resources"
}
