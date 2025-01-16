terraform {
  required_version = ">= 0.13"

  backend "azurerm" {}
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.16.0"
    }
  }
}


provider "azurerm" {
  skip_provider_registration = true
  features {}
}

provider "azurerm" {
  alias           = "data"
  subscription_id = var.data_subscription
  features {}
}
