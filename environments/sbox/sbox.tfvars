project                        = "hmcts"
location                       = "uksouth"
env                            = "sbox"
subscription                   = "sbox"
sku_tier                       = "Free"
sku_size                       = "Free"
hub_app_gw_private_ip_address  = ["10.10.200.212"]
backend_agw_private_ip_address = ["10.2.13.112"]
data_subscription              = "bf308a5c-0624-4334-8ff8-8dca9fd43783"
key_vault_subscription         = "b72ab7b7-723f-4b18-b6f6-03b0f2c6a1bb"
privatedns_subscription        = "1497c3d7-ab6d-4bb7-8a10-b51d03189ee3"
oms_env                        = "sandbox"

#FrontDoor access policy
add_access_policy = true

cdn_sku    = "Standard_Verizon"
shutter_rg = "shutter-app-sbox-rg"

frontend_agw_private_ip_address = "10.2.13.114"
cft_apps_cluster_ips            = ["10.2.9.250", "10.2.11.250"]

apim_appgw_backend_pool_fqdns = ["firewall-sbox-int-palo-cftapimgmt.uksouth.cloudapp.azure.com"]

hub          = "sbox"
autoShutdown = true

frontends = [
  {
    product          = "idam"
    name             = "idam-web-public"
    custom_domain    = "idam-web-public.sandbox.platform.hmcts.net"
    mode             = "Prevention"
    dns_zone_name    = "sandbox.platform.hmcts.net"
    backend_domain   = ["firewall-sbox-int-palo-sbox.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-sandbox-platform-hmcts-net"
    shutter_app      = false
    global_exclusions = [
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "client_id"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "client_id"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "code"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "scope"
      },
      {
        match_variable = "RequestBodyPostArgNames",
        operator       = "Equals",
        selector       = "description"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_ga"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_gat"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_gid"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "dtSa"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "dtCookie"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "dtLatC"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "dtPC"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "rxVisitor"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "rxvt"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "cookies_policy"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "cookies_preferences_set"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "seen_cookie_message"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "Idam.AuthId"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "Idam.Session"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "iss"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "jwt"
      },
      {
        match_variable = "RequestBodyPostArgNames",
        operator       = "Equals",
        selector       = "label"
      },
      {
        match_variable = "RequestBodyPostArgNames",
        operator       = "Equals",
        selector       = "oauth2ClientSecret"
      },
      {
        match_variable = "RequestBodyPostArgNames",
        operator       = "StartsWith",
        selector       = "password"
      },
      {
        match_variable = "RequestBodyPostArgNames",
        operator       = "StartsWith",
        selector       = "username"
      },
      {
        match_variable = "RequestBodyPostArgNames",
        operator       = "StartsWith",
        selector       = "email"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "redirect_uri"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "redirect_uri"
      },
      {
        match_variable = "QueryStringArgNames",
        operator       = "Equals",
        selector       = "redirectUri"
      },
      {
        match_variable = "RequestBodyPostArgNames",
        operator       = "Equals",
        selector       = "redirectUri"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "referer"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "refresh_token"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "refresh_token"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "response_type"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "scope"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "state"
      },
      {
        match_variable = "RequestBodyPostArgNames",
        operator       = "Equals",
        selector       = "state"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "token"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "token"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "Idam.SSOSession"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "session_state"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "code"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "nonce"
      },
      {
        match_variable = "RequestBodyPostArgNames",
        operator       = "Equals",
        selector       = "nonce"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "post_logout_redirect_uri"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "id_token_hint"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "code_challenge"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "code_challenge"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "code_verifier"
      }
    ]
  },
  {
    product       = "idam"
    name          = "hmcts-access"
    mode          = "Prevention"
    custom_domain = "hmcts-access.sandbox.platform.hmcts.net"
    dns_zone_name = "sandbox.platform.hmcts.net"
    shutter_app   = false

    backend_domain   = ["firewall-sbox-int-palo-sbox.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-sandbox-platform-hmcts-net"

    global_exclusions = [
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "client_id"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "client_id"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "code"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "scope"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "dtSa"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "dtCookie"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "connect.sid"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "dtLatC"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "dtPC"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "rxVisitor"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "rxvt"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "Idam.AuthId"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "Idam.Session"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "Idam.Reset"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "Idam.Register"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "connect.sid"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "iss"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "jwt"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "redirect_uri"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "redirect_uri"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "redirectUri"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "refresh_token"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "refresh_token"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "response_type"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "scope"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "state"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "token"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "token"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "code"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "nonce"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "post_logout_redirect_uri"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "id_token_hint"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "code_challenge"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "code_challenge"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "code_verifier"
      }
    ]

  },
  {
    product          = "idam"
    name             = "idam-user-dashboard"
    custom_domain    = "idam-user-dashboard.sandbox.platform.hmcts.net"
    mode             = "Prevention"
    dns_zone_name    = "sandbox.platform.hmcts.net"
    shutter_app      = false
    backend_domain   = ["firewall-sbox-int-palo-sbox.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-sandbox-platform-hmcts-net"

    custom_rules = [
      {
        name     = "IPMatchWhitelist"
        priority = 1
        type     = "MatchRule"
        action   = "Block"
        match_conditions = [
          {
            match_variable     = "RemoteAddr"
            operator           = "IPMatch"
            negation_condition = true
            match_values = [
              "52.151.96.225/32",
              "81.134.202.29/32",
              "51.145.6.230/32",
              "51.145.4.100/32",
              "194.33.192.0/25",
              "51.149.249.0/27",
              "194.33.196.0/25",
              "51.149.249.32/27",
              "52.210.206.51/32",
              "62.25.109.201/32",
              "62.25.109.203/32",
              "20.39.161.231/32",
              "20.49.137.7/32",
              "20.49.137.196/32",
              "130.41.221.91/32",
              "130.41.221.93/32",
              "130.41.128.253/32",
              "130.41.221.92/32",
              "130.41.221.94/32",
            ]
          }
        ]
      }
    ],
    global_exclusions = [
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "Idam.AuthId"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "Idam.Session"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "idam-user-dashboard-session"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "idam_user_dashboard_session"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "auth_verification"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "jwt"
      },
      {
        match_variable = "QueryStringArgNames",
        operator       = "Equals",
        selector       = "redirectUri"
      },
      {
        match_variable = "RequestBodyPostArgNames",
        operator       = "Equals",
        selector       = "redirectUri"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "refresh_token"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "refresh_token"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "token"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "token"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "client_id"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "code"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "code"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "response_type"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "scope"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "iss"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "dtSa"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "dtCookie"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "dtLatC"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "dtPC"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "rxVisitor"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "rxvt"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "_csrf"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "_csrf"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_csrf"
      }
    ]
  },
  {
    product          = "plum"
    name             = "plum"
    custom_domain    = "plum.sandbox.platform.hmcts.net"
    dns_zone_name    = "sandbox.platform.hmcts.net"
    backend_domain   = ["firewall-sbox-int-palo-sbox.uksouth.cloudapp.azure.com", "lb-sbox-int-plum.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-sandbox-platform-hmcts-net"
    disabled_rules   = {}
    shutter_app      = true
  },
  {
    product          = "plumclassic"
    name             = "plumclassic"
    custom_domain    = "frontdoor.sandbox.platform.hmcts.net"
    dns_zone_name    = "frontdoor.sandbox.platform.hmcts.net"
    backend_domain   = ["firewall-sbox-int-palo-sbox.uksouth.cloudapp.azure.com"]
    certificate_name = "frontdoor-sandbox-platform-hmcts-net"
    disabled_rules   = {}
    shutter_app      = true
    ssl_mode         = "AzureKeyVault"
  },
  {
    product          = "hmi"
    name             = "hmi-apim"
    custom_domain    = "hmi-apim.sandbox.platform.hmcts.net"
    dns_zone_name    = "sandbox.platform.hmcts.net"
    shutter_app      = false
    backend_domain   = ["firewall-sbox-int-palo-hmiapimsbox.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-sandbox-platform-hmcts-net"
    cache_enabled    = "false"
  },
  {
    product          = "cft-api-mgmt"
    name             = "cft-api-mgmt"
    custom_domain    = "cft-api-mgmt.sandbox.platform.hmcts.net"
    dns_zone_name    = "sandbox.platform.hmcts.net"
    shutter_app      = false
    backend_domain   = ["firewall-sbox-int-palo-cftapimgmt.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-sandbox-platform-hmcts-net"
    cache_enabled    = "false"
  },
  {
    product                        = "reform"
    name                           = "reformscan"
    custom_domain                  = "reformscan.sandbox.platform.hmcts.net"
    dns_zone_name                  = "sandbox.platform.hmcts.net"
    shutter_app                    = false
    backend_domain                 = ["firewall-prod-int-palo-reformscansbox.uksouth.cloudapp.azure.com"]
    certificate_name               = "wildcard-sandbox-platform-hmcts-net"
    appgw_cookie_based_affinity    = "Enabled"
    cache_enabled                  = "false"
    certificate_name_check_enabled = false
  },
  {
    product          = "labs"
    name             = "labs-rhodrif-nodejs"
    custom_domain    = "labs-rhodrif-nodejs.sandbox.platform.hmcts.net"
    dns_zone_name    = "sandbox.platform.hmcts.net"
    shutter_app      = false
    backend_domain   = ["firewall-sbox-int-palo-sbox.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-sandbox-platform-hmcts-net"
  },
  {
    product          = "labs-apps-njs"
    name             = "labs-apps-njs"
    custom_domain    = "labs-apps-njs.sandbox.platform.hmcts.net"
    dns_zone_name    = "sandbox.platform.hmcts.net"
    shutter_app      = false
    backend_domain   = ["lb-sbox-int-labs-apps-njs.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-sandbox-platform-hmcts-net"
  },
  {
    product          = "labs-goldenpath-khaled"
    name             = "labs-goldenpath-khaled"
    custom_domain    = "labs-goldenpath-khaled.sandbox.platform.hmcts.net"
    dns_zone_name    = "sandbox.platform.hmcts.net"
    shutter_app      = false
    backend_domain   = ["firewall-sbox-int-palo-labs-goldenpath-khaled.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-sandbox-platform-hmcts-net"
    disabled_rules   = {}
  },
  {
    product          = "labs-endakelly-nodejs"
    name             = "labs-endakelly-nodejs"
    custom_domain    = "labs-endakelly-nodejs.sandbox.platform.hmcts.net"
    dns_zone_name    = "sandbox.platform.hmcts.net"
    shutter_app      = false
    backend_domain   = ["firewall-sbox-int-palo-labs-endakelly-nodejs.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-sandbox-platform-hmcts-net"
    disabled_rules   = {}
  },
]

apim_appgw_exclusions = [
  {
    match_variable = "RequestArgNames"
    operator       = "Equals"
    selector       = "iss"
  }
]
