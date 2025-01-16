terraform {
  required_version = ">= 1.4.6"

  backend "azurerm" {
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.16.0"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "azurerm" {
  subscription_id            = local.hub[local.hub_env].subscription
  skip_provider_registration = "true"
  features {}
  alias = "hub"
}

provider "azurerm" {
  subscription_id            = var.key_vault_subscription
  skip_provider_registration = "true"
  features {}
  alias = "kv"
}
