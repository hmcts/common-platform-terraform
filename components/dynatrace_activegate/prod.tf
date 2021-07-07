module "dynatrace_activegate" {

  providers = {
    azurerm     = azurerm
    azurerm.law = azurerm.law_prod
  }

  source         = "../../modules/dynatrace-activegate"
  instance_count = 3
  network_zone   = "azure.cft"

  common_tags = module.ctags.common_tags
}