resource "azurerm_subnet_network_security_group_association" "devops_subnet_nsg" {
  subnet_id                 = azurerm_subnet.devops_subnet.id
  network_security_group_id = azurerm_network_security_group.devops_nsg.id
}
