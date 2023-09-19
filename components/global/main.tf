data "azurerm_subscription" "current" {}

locals {
  key_vault_name = "acme${replace(lower(data.azurerm_subscription.current.display_name), "-", "")}"
}

module "landing_zone" {
  source = "git::https://github.com/hmcts/terraform-module-frontdoor.git?ref=master"

  common_tags                = module.ctags.common_tags
  env                        = var.env
  project                    = var.project
  location                   = var.location
  frontends                  = var.frontends
  ssl_mode                   = var.ssl_mode
  resource_group             = data.azurerm_resource_group.main.name
  subscription_id            = data.azurerm_subscription.current.subscription_id
  certificate_key_vault_name = local.key_vault_name
  oms_env                    = var.oms_env
  certificate_name_check     = var.certificate_name_check
  key_vault_resource_group   = data.azurerm_resource_group.key_vault.name
  log_analytics_workspace_id = module.log_analytics_workspace.workspace_id
  add_access_policy          = var.add_access_policy
}

module "ctags" {
  source       = "git::https://github.com/hmcts/terraform-module-common-tags.git?ref=master"
  environment  = var.env
  product      = var.product
  builtFrom    = var.builtFrom
  expiresAfter = var.expiresAfter
}


provider "azurerm" {
  alias           = "public_dns"
  subscription_id = "ed302caf-ec27-4c64-a05e-85731c3ce90e"

  features {}
}

module "frontdoor_classic" {
  count  = var.env == "sbox" ? 1 : 0
  source = "git::https://github.com/hmcts/terraform-module-frontdoor.git?ref=DTSPO-13992-test-new-version-of-frontdoor"

  common_tags                = module.ctags.common_tags
  env                        = var.env
  project                    = "cnphmcts-classic"
  location                   = var.location
  frontends                  = var.frontend_classic
  new_frontends              = var.frontend_classic
  ssl_mode                   = var.ssl_mode
  resource_group             = data.azurerm_resource_group.main.name
  subscription_id            = data.azurerm_subscription.current.subscription_id
  certificate_key_vault_name = local.key_vault_name
  oms_env                    = var.oms_env
  certificate_name_check     = var.certificate_name_check
  key_vault_resource_group   = data.azurerm_resource_group.key_vault.name
  log_analytics_workspace_id = module.log_analytics_workspace.workspace_id
  front_door_sku_name        = "Premium_AzureFrontDoor"
  add_access_policy          = "false"
  add_access_policy_role     = "false"
  providers                  = { azurerm.public_dns = azurerm.public_dns }
}
