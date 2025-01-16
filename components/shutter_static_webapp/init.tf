terraform {
  required_version = "1.10.4"

  backend "azurerm" {}
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.16.0" # we have to keep this to 3.65 as there are problems related to  Failure sending request: StatusCode=429 -- Original Error: context deadline exceeded
    }
  }
}
provider "azurerm" {
  features {}
  skip_provider_registration = true
}
provider "azurerm" {
  alias = "dnszone"
  features {}
  subscription_id            = "ed302caf-ec27-4c64-a05e-85731c3ce90e"
  skip_provider_registration = true
}
provider "azurerm" {
  alias = "githubkey"
  features {}
  subscription_id            = "1baf5470-1c3e-40d3-a6f7-74bfbce4b348"
  skip_provider_registration = true
}
