project                    = "hmcts"
location                   = "uksouth"
env                        = "preview"
subscription               = "dev"
ssl_mode                   = "AzureKeyVault"
certificate_key_vault_name = "cftapps-dev"

data_subscription = "1c4f0704-a29e-403d-b719-b90c34ef14c9"
oms_env           = "nonprod"

frontends = [
  {
    name           = "hmi-apim"
    custom_domain  = "hmi-apim.dev.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-hmiapimdev.uksouth.cloudapp.azure.com"]
    ssl_mode       = "FrontDoor"
    cache_enabled  = "false"
  },
  {
    name                        = "reformscan"
    custom_domain               = "reformscan.preview.platform.hmcts.net"
    backend_domain              = ["firewall-prod-int-palo-reformscanpreview.uksouth.cloudapp.azure.com"]
    ssl_mode                    = "FrontDoor"
    appgw_cookie_based_affinity = "Enabled"
    cache_enabled               = "false"
  }
]
