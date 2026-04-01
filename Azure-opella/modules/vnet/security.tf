resource "azurerm_network_security_group" "nsg" {
  count               = var.enable_nsg ? 1 : 0
  name                = "${var.vnet_name}-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = var.tags
}

resource "azurerm_network_security_rule" "allow_ssh" {
  count                       = var.enable_nsg ? 1 : 0
  name                        = "allow-ssh"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix   = "*"
  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.nsg[0].name
}