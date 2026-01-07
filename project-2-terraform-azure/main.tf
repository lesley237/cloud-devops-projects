resource "azurerm_resource_group" "devops_rg" {
  name     = var.resource_group_name
  location = var.location
}
