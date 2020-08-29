provider "azurerm" {
    version = 1.38
    }

resource "azurerm_network_security_group" "nsg" {
    name = "LabNSG"
    location = "East US"
    resource_group_name = "185-19e49c1f-create-azure-nsgs-with-terraform-8w8"
}

resource "azurerm_network_security_rule" "rule1" {
    name = "Web80"
    priority = 1001
    direction = "Inbound"
    access = "Allow"
    protocol = "Tcp"
    source_port_range = "80"
    destination_port_range = "80"
    source_address_prefix = "*"
    destination_address_prefix = "*"
    resource_group_name = "185-19e49c1f-create-azure-nsgs-with-terraform-8w8"
    network_security_group_name = azurerm_network_security_group.nsg.name
}

resource "azurerm_network_security_rule" "rule2" {
    name = "Web8080"
    priority = 1000
    direction = "Inbound"
    access = "Deny"
    protocol = "Tcp"
    source_port_range = "8080"
    destination_port_range = "8080"
    source_address_prefix = "*"
    destination_address_prefix = "*"
    resource_group_name = "185-19e49c1f-create-azure-nsgs-with-terraform-8w8"
    network_security_group_name = azurerm_network_security_group.nsg.name
}

resource "azurerm_network_security_rule" "rule3" {
    name = "SSH"
    priority = 1100
    direction = "Inbound"
    access = "Allow"
    protocol = "Tcp"
    source_port_range = "*"
    destination_port_range = "22"
    source_address_prefix = "*"
    destination_address_prefix = "*"
    resource_group_name = "185-19e49c1f-create-azure-nsgs-with-terraform-8w8"
    network_security_group_name = azurerm_network_security_group.nsg.name
}

resource "azurerm_network_security_rule" "rule4" {
    name = "Web80Out"
    priority = 1000
    direction = "Outbound"
    access = "Deny"
    protocol = "Tcp"
    source_port_range = "80"
    destination_port_range = "80"
    source_address_prefix = "*"
    destination_address_prefix = "*"
    resource_group_name = "185-19e49c1f-create-azure-nsgs-with-terraform-8w8"
    network_security_group_name = azurerm_network_security_group.nsg.name
}