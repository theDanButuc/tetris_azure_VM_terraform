resource "azurerm_network_security_group" "dan-security-group" {
  name                = "dan-security-group"
  location            = azurerm_resource_group.dan-rg.location
  resource_group_name = azurerm_resource_group.dan-rg.name

  security_rule {
    name                       = "dan-test-rule"
    priority                   = 1002
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "8095"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

    security_rule {
    name                       = "dan-ssh-rule"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  } 

  tags = {
    environment = "Test"
  }
}

resource "azurerm_subnet_network_security_group_association" "dan-subnet-nsg-association" {
  subnet_id                 = azurerm_subnet.dan-subnet.id
  network_security_group_id = azurerm_network_security_group.dan-security-group.id
}