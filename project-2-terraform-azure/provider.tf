terraform {
  required_version = ">= 1.4.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  backend "azurerm" {
     resource_group_name  = "rg-terraform-backend"
     storage_account_name = "terraformstatelesley"
     container_name       = "tfstate"
     key                  = "project2terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}
