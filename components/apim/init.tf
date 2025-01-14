terraform {
  required_version = ">= 1.0.10"

  backend "azurerm" {
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.117.0"
    }
  }
}

provider "azurerm" {
  features {}
}
