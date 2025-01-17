terraform {
  required_version = ">= 0.13"

  backend "azurerm" {}
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.117.0"
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
