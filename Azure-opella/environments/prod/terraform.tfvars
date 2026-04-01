environment = "prod"

location            = "eastus"
resource_group_name = "rg-prod"

vnet_name     = "vnet-prod"
address_space = ["10.10.0.0/16"]

subnet_name   = "subnet-prod"
subnet_prefix = ["10.10.1.0/24"]

vm_name        = "vm-prod"
admin_username = "service account" 

