terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.23.0"
    }
  }
  # backend "azurerm" {
  #   resource_group_name   = "danResourceGroup"
  #   storage_account_name  = "tfstatestoragedan"
  #   container_name        = "tfstate-container"
  #   key                   = "terraform.tfstate"
  # }
}

provider "azurerm" {
  features {}
  subscription_id = "b8ad5888-e999-4f9a-9e93-5e885c47586f"
}