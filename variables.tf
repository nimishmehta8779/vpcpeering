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
variable "accepter_vpc_subnet_cidr" {
 description = "Enter the accepter Subnet CIDR" 
}
variable "owner_vpc_subnet_cidr" {
 description = "Enter the owner Subnet CIDR" 
}
variable "cross_iam_role" {
type = string
description = "Enter the iam role arn"
}
variable "enabled" {
  default     = "true"
  description = "Set to false to prevent the module from creating or accessing any resources"
}

