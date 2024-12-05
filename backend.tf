# backend.tf

terraform {
  backend "azurerm" {
    resource_group_name  = "terraform-state-rg"
    storage_account_name = "tfstateproj1"
    container_name       = "tfstate"
    key                  = "project1.tfstate"
  }
}