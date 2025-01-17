locals {
  shutter_apps = [for k, v in var.frontends : v if lookup(v, "shutter_app", false)]
}
module "static_webapp" {
  providers = {
    azurerm         = azurerm
    azurerm.dnszone = azurerm.dnszone
  }

  source              = "git::https://github.com/hmcts/terraform-module-shutter-static-webapp.git?ref=endakelly-patch-1"
  shutter_apps        = local.shutter_apps
  tags                = module.ctags.common_tags
  resource_group_name = azurerm_resource_group.rg.name
  gh_token            = data.azurerm_key_vault_secret.githubapi.value
  env                 = var.env
  sku_tier            = var.sku_tier
  sku_size            = var.sku_size
}

module "ctags" {
  source       = "git::https://github.com/hmcts/terraform-module-common-tags.git?ref=master"
  environment  = var.env
  product      = var.product
  builtFrom    = var.builtFrom
  expiresAfter = var.expiresAfter
}

output "debug_shutter" {
  value = local.shutter_apps
}
