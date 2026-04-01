variable "vnet_name" {
  description = "Name of the VNet"
  type        = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "address_space" {
  type = list(string)
}

variable "subnets" {
  type = list(object({
    name              = string
    cidr              = string
    service_endpoints = optional(list(string))
  }))
}

variable "enable_nsg" {
  type    = bool
  default = false
}

variable "tags" {
  type    = map(string)
  default = {}
}