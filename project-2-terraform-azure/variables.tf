variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
  default     = "rg-terraform-devops"
}

variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "eastasia"
}
