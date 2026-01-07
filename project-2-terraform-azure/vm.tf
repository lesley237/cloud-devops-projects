resource "azurerm_linux_virtual_machine" "devops_vm" {
  name                = "vm-devops"
  resource_group_name = azurerm_resource_group.devops_rg.name
  location            = azurerm_resource_group.devops_rg.location
  size                = "Standard_B2ats_v2"
  admin_username      = "azureuser"

  custom_data = base64encode(file("cloud-init.sh"))

  network_interface_ids = [
    azurerm_network_interface.devops_nic.id
  ]

  admin_ssh_key {
    username   = "azureuser"
    public_key = file("C:/Users/kiit/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  tags = {
    environment = "dev"
    project     = "terraform-devops"
  }
}


