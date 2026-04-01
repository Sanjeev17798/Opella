variable "environment" {}
variable "location" {}
variable "resource_group_name" {}

variable "vnet_name" {}
variable "address_space" {
  type = list(string)
}

variable "subnet_name" {}
variable "subnet_prefix" {
  type = list(string)
}

