resource "azurerm_resource_group" "this" {
  name     = var.resource_group_name
  location = var.location

  tags = {
    environment = var.environment
  }
}

# VNET Module
module "vnet" {
  source = "./modules/vnet"

  vnet_name           = var.vnet_name
  location            = var.location
  resource_group_name = azurerm_resource_group.this.name

  address_space = var.address_space
  subnet_name   = var.subnet_name
  subnet_prefix = var.subnet_prefix

  environment = var.environment
}

# Public IP
resource "azurerm_public_ip" "this" {
  name                = "${var.vm_name}-pip"
  location            = var.location
  resource_group_name = azurerm_resource_group.this.name
  allocation_method   = "Dynamic"

  tags = {
    environment = var.environment
  }
}

# NIC
resource "azurerm_network_interface" "this" {
  name                = "${var.vm_name}-nic"
  location            = var.location
  resource_group_name = azurerm_resource_group.this.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = module.vnet.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.this.id
  }
}

# VM
resource "azurerm_linux_virtual_machine" "this" {
  name                = var.vm_name
  location            = var.location
  resource_group_name = azurerm_resource_group.this.name
  size                = "Standard_B1s"

  admin_username = var.admin_username
  admin_password = var.admin_password
  disable_password_authentication = false

  network_interface_ids = [
    azurerm_network_interface.this.id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  tags = {
    environment = var.environment
  }
}