terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id = "2a1f765f-c81a-419f-a920-25a2c9e38966"
  tenant_id       = "49bba7a4-424b-4070-a70e-886e9dd7caef"
}
