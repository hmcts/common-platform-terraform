env                    = "demo"
subscription           = "demo"
cft_apps_cluster_ips   = ["10.50.95.221"]
certificate_name_check = false
autoShutdown           = true

frontend_agw_private_ip_address = "10.50.97.122"
backend_agw_private_ip_address  = ["10.50.97.118", "10.50.97.119"]

data_subscription       = "1c4f0704-a29e-403d-b719-b90c34ef14c9"
privatedns_subscription = "1baf5470-1c3e-40d3-a6f7-74bfbce4b348"
oms_env                 = "nonprod"
#trigger precommit
hub = "nonprod"

frontends = [
  {
    name                           = "reformscan"
    custom_domain                  = "reformscan.demo.platform.hmcts.net"
    dns_zone_name                  = "demo.platform.hmcts.net"
    host_header                    = "reformscandemo.blob.core.windows.net"
    mode                           = "Detection"
    backend_domain                 = ["firewall-nonprodi-palo-reformscandemo.uksouth.cloudapp.azure.com"]
    forwarding_protocol            = "MatchRequest"
    health_path                    = "/"
    health_protocol                = "Https"
    cache_enabled                  = "false"
    certificate_name_check_enabled = false
  },
  {
    product          = "cft-api-mgmt"
    name             = "cft-api-mgmt"
    custom_domain    = "cft-api-mgmt.demo.platform.hmcts.net"
    dns_zone_name    = "demo.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-cftapimgmtdemo.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-demo-platform-hmcts-net"
    cache_enabled    = "false"
  },
  {
    product          = "plum-public"
    name             = "plum-public"
    custom_domain    = "plum-public.demo.platform.hmcts.net"
    dns_zone_name    = "demo.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-demo-platform-hmcts-net"
  },
  {
    product          = "plum"
    name             = "plum"
    custom_domain    = "plum.demo.platform.hmcts.net"
    dns_zone_name    = "demo.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-demo-platform-hmcts-net"
  },
  {
    product          = "dss-update-case"
    name             = "dss-update-case"
    custom_domain    = "dss-update-case.demo.platform.hmcts.net"
    dns_zone_name    = "demo.platform.hmcts.net"
    mode             = "Detection"
    backend_domain   = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-demo-platform-hmcts-net"
    cache_enabled    = "false"
    global_exclusions = [
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "rf"
      },
    ]
  },
  {
    name             = "hmi-apim"
    custom_domain    = "hmi-apim.demo.platform.hmcts.net"
    dns_zone_name    = "demo.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-hmiapimdemo.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-demo-platform-hmcts-net"
    cache_enabled    = "false"
  },
  {
    name           = "div-dn"
    custom_domain  = "decree-nisi-aks.demo.platform.hmcts.net"
    dns_zone_name  = "demo.platform.hmcts.net"
    mode           = "Prevention"
    backend_domain = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]

    global_exclusions = [
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "connect.sid"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "cookies_policy"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "__auth-token"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "session"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "iss"
      },
    ]
  },
  {
    name           = "div-da"
    custom_domain  = "decree-absolute-aks.demo.platform.hmcts.net"
    dns_zone_name  = "demo.platform.hmcts.net"
    mode           = "Prevention"
    backend_domain = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]

    global_exclusions = [
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "connect.sid"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "cookies_policy"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "__auth-token"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "iss"
      },
    ]
  },
  {
    name           = "div-rfe"
    custom_domain  = "respond-divorce-aks.demo.platform.hmcts.net"
    dns_zone_name  = "demo.platform.hmcts.net"
    mode           = "Prevention"
    backend_domain = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]

    global_exclusions = [
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "connect.sid"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "cookies_policy"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "__auth-token"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "iss"
      },
    ]
  },
  {
    name           = "div-pfe"
    custom_domain  = "petitioner-frontend-aks.demo.platform.hmcts.net"
    dns_zone_name  = "demo.platform.hmcts.net"
    mode           = "Prevention"
    backend_domain = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]

    global_exclusions = [
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "connect.sid"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "cookies_policy"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "__auth-token"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "iss"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "__auth-token"
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
        match_variable = "RequestBodyPostArgNames"
        operator       = "StartsWith"
        selector       = "reasonForDivorceBehaviourDetails"
      },
    ]
  },
  {
    name           = "fact"
    mode           = "Prevention"
    custom_domain  = "fact.demo.platform.hmcts.net"
    dns_zone_name  = "demo.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]

    global_exclusions = [
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "connect.sid"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "cookies_policy"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "__auth-token"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "iss"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "rxVisitor"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_ga"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_gid"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_gat"
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
        selector       = "dtSa"
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
        selector       = "i18next"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "fact-cookie-preferences"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_oauth2_proxy"
      }
    ]
  },
  {
    name           = "fact-admin"
    mode           = "Detection"
    custom_domain  = "fact-admin.demo.platform.hmcts.net"
    dns_zone_name  = "demo.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]

  },
  {
    name           = "et-sya"
    mode           = "Detection"
    custom_domain  = "et-sya.demo.platform.hmcts.net"
    dns_zone_name  = "demo.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]

  },
  {
    name           = "paybubble"
    custom_domain  = "paybubble.demo.platform.hmcts.net"
    dns_zone_name  = "demo.platform.hmcts.net"
    mode           = "Prevention"
    backend_domain = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]

    global_exclusions = [
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "referer"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "iss"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "__auth-token"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "__user-info"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "__redirect"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "dtSa"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "rf"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "DecodedUrl"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "__pcipal-info"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "connect.sid"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "ccpay-bubble-cookie-preferences"
      },
    ]
  },
  {
    name           = "paybubble-int"
    custom_domain  = "paybubble-int.demo.platform.hmcts.net"
    dns_zone_name  = "demo.platform.hmcts.net"
    mode           = "Prevention"
    backend_domain = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]

    global_exclusions = [
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "referer"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "iss"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "__auth-token"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "__user-info"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "__redirect"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "dtSa"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "rf"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "DecodedUrl"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "__pcipal-info"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "connect.sid"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "ccpay-bubble-cookie-preferences"
      },
    ]
  },
  {
    name           = "paymentoutcome-web"
    mode           = "Detection"
    custom_domain  = "paymentoutcome-web.demo.platform.hmcts.net"
    dns_zone_name  = "demo.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]
    www_redirect   = true
  },
  {
    name           = "paymentoutcome-web-int"
    mode           = "Detection"
    custom_domain  = "paymentoutcome-web-int.demo.platform.hmcts.net"
    dns_zone_name  = "demo.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]
    www_redirect   = true
  },
  {
    name           = "fees-register"
    custom_domain  = "fees-register.demo.platform.hmcts.net"
    dns_zone_name  = "demo.platform.hmcts.net"
    mode           = "Prevention"
    backend_domain = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]

    custom_rules = [
      {
        name     = "IPMatchWhitelist"
        priority = 1
        type     = "MatchRule"
        action   = "Block"
        match_conditions = [
          {
            match_variable     = "RequestUri"
            operator           = "EndsWith"
            negation_condition = false
            match_values = [
              "/fees"
            ]
          }
        ]
      },
    ],
    global_exclusions = [
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "iss"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "__auth-token"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "__redirect"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "fee-register-admin-web-cookie-preferences"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "rf"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "DecodedUrl"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "QueryParamName"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "DecodedPath"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "PostParamName"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "expression"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "GroupName"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "NFuse_Application"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "banner_id"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "callback"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "reply_message_template"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "name"
      },
      {
        match_variable = "RequestHeaderNames"
        operator       = "Equals"
        selector       = "User-Agent"
      },
      {
        match_variable = "RequestHeaderNames"
        operator       = "Equals"
        selector       = "content-type"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "csvFees"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "description"
      },
    ]
  },
  {
    name           = "fees-register-int"
    custom_domain  = "fees-register-int.demo.platform.hmcts.net"
    dns_zone_name  = "demo.platform.hmcts.net"
    mode           = "Prevention"
    backend_domain = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]

    custom_rules = [
      {
        name     = "IPMatchWhitelist"
        priority = 1
        type     = "MatchRule"
        action   = "Block"
        match_conditions = [
          {
            match_variable     = "RequestUri"
            operator           = "EndsWith"
            negation_condition = false
            match_values = [
              "/fees"
            ]
          }
        ]
      },
    ],
    global_exclusions = [
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "iss"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "__auth-token"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "__redirect"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "fee-register-admin-web-cookie-preferences"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "rf"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "DecodedUrl"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "QueryParamName"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "DecodedPath"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "PostParamName"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "expression"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "GroupName"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "NFuse_Application"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "banner_id"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "callback"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "reply_message_template"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "name"
      },
      {
        match_variable = "RequestHeaderNames"
        operator       = "Equals"
        selector       = "User-Agent"
      },
      {
        match_variable = "RequestHeaderNames"
        operator       = "Equals"
        selector       = "content-type"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "csvFees"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "description"
      },
    ]
  },
  {
    name           = "fis-ds-web"
    custom_domain  = "fis-ds-web.demo.platform.hmcts.net"
    dns_zone_name  = "demo.platform.hmcts.net"
    mode           = "Detection"
    backend_domain = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]
    global_exclusions = [
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "rf"
      },
    ]
  },
  {
    name           = "ia-aip"
    mode           = "Detection"
    custom_domain  = "immigration-appeal.demo.platform.hmcts.net"
    dns_zone_name  = "demo.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]

  },
  {
    name           = "lau"
    mode           = "Detection"
    custom_domain  = "lau.demo.platform.hmcts.net"
    dns_zone_name  = "demo.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]
  },
  {
    name           = "lau-int"
    mode           = "Detection"
    custom_domain  = "lau-int.demo.platform.hmcts.net"
    dns_zone_name  = "demo.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]
  },
  {
    name           = "civil-citizen-ui"
    mode           = "Detection"
    custom_domain  = "moneyclaims.demo.platform.hmcts.net"
    dns_zone_name  = "demo.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]

  },
  {
    name           = "cmc"
    mode           = "Detection"
    custom_domain  = "moneyclaims1.demo.platform.hmcts.net"
    dns_zone_name  = "demo.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]

  },
  {
    name           = "nfdiv"
    mode           = "Detection"
    custom_domain  = "nfdiv.demo.platform.hmcts.net"
    dns_zone_name  = "demo.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]
  },
  {
    name             = "nfdiv-apply"
    mode             = "Detection"
    custom_domain    = "nfdiv-apply-for-divorce.demo.platform.hmcts.net"
    dns_zone_name    = "demo.platform.hmcts.net"
    backend          = "nfdiv"
    certificate_name = "wildcard-demo-platform-hmcts-net"
  },
  {
    name             = "nfdiv-civil"
    mode             = "Detection"
    custom_domain    = "nfdiv-end-civil-partnership.demo.platform.hmcts.net"
    dns_zone_name    = "demo.platform.hmcts.net"
    backend          = "nfdiv"
    certificate_name = "wildcard-demo-platform-hmcts-net"
  },
  {
    name           = "pcq"
    mode           = "Detection"
    custom_domain  = "pcq.demo.platform.hmcts.net"
    dns_zone_name  = "demo.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]
    global_exclusions = [
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "connect.sid"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "_csrf"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "pcq-cookie-preferences"
      },
      // Google Analytics Exclusions
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_ga"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_gid"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_gat"
      },
      // Dynatrace Exclusions
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "dtCookie"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "dtSa"
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
        selector       = "dtSa"
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
      }
    ],
    custom_rules = [
      {
        name     = "RumBeaconExclusion"
        priority = 100
        type     = "MatchRule"
        action   = "Allow"
        match_conditions = [
          {
            match_variable     = "RequestMethod"
            operator           = "Equal"
            negation_condition = false
            match_values = [
              "POST"
            ]
          },
          {
            match_variable     = "RequestUri"
            operator           = "Contains"
            negation_condition = false
            match_values = [
              "/rb_"
            ]
          }
        ]
      },
    ]
  },
  {
    name           = "pcq-int"
    mode           = "Detection"
    custom_domain  = "pcq-int.demo.platform.hmcts.net"
    dns_zone_name  = "demo.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]
    global_exclusions = [
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "connect.sid"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "_csrf"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "pcq-cookie-preferences"
      },
      // Google Analytics Exclusions
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_ga"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_gid"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_gat"
      },
      // Dynatrace Exclusions
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "dtCookie"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "dtSa"
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
        selector       = "dtSa"
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
      }
    ],
    custom_rules = [
      {
        name     = "RumBeaconExclusion"
        priority = 100
        type     = "MatchRule"
        action   = "Allow"
        match_conditions = [
          {
            match_variable     = "RequestMethod"
            operator           = "Equal"
            negation_condition = false
            match_values = [
              "POST"
            ]
          },
          {
            match_variable     = "RequestUri"
            operator           = "Contains"
            negation_condition = false
            match_values = [
              "/rb_"
            ]
          }
        ]
      },
    ]
  },
  {
    name           = "privatelaw"
    custom_domain  = "privatelaw.demo.platform.hmcts.net"
    dns_zone_name  = "demo.platform.hmcts.net"
    mode           = "Detection"
    backend_domain = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]
    global_exclusions = [
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "rf"
      },
    ]
  },
  {
    name           = "probate"
    custom_domain  = "probate.demo.platform.hmcts.net"
    dns_zone_name  = "demo.platform.hmcts.net"
    mode           = "Detection"
    backend_domain = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]
    custom_rules = [
      {
        name     = "RumBeaconExclusion"
        priority = 100
        type     = "MatchRule"
        action   = "Allow"
        match_conditions = [
          {
            match_variable     = "RequestMethod"
            operator           = "Equal"
            negation_condition = false
            match_values = [
              "POST"
            ]
          },
          {
            match_variable     = "RequestUri"
            operator           = "Contains"
            negation_condition = false
            match_values = [
              "/rb_"
            ]
          }
        ]
      },
    ],
    disabled_rules = {
      RCE = [
        "932115"
      ]
    }
  },
  {
    name           = "rpts"
    mode           = "Prevention"
    custom_domain  = "rpts.demo.platform.hmcts.net"
    dns_zone_name  = "demo.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]
  },
  {
    name           = "bar"
    custom_domain  = "bar.demo.platform.hmcts.net"
    dns_zone_name  = "demo.platform.hmcts.net"
    mode           = "Detection"
    backend_domain = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]

  },
  {
    name           = "bar-int"
    custom_domain  = "bar-int.demo.platform.hmcts.net"
    dns_zone_name  = "demo.platform.hmcts.net"
    mode           = "Detection"
    backend_domain = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]

  },
  {
    name           = "ac-int-gateway-ccd"
    mode           = "Detection"
    custom_domain  = "ac-int-gateway-ccd.demo.platform.hmcts.net"
    dns_zone_name  = "demo.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]

  },
  {
    name           = "adoption-web"
    custom_domain  = "adoption-web.demo.platform.hmcts.net"
    dns_zone_name  = "demo.platform.hmcts.net"
    mode           = "Detection"
    backend_domain = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]
    global_exclusions = [
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "rf"
      },
    ]
  },
  {
    product          = "sptribs-frontend"
    name             = "sptribs-frontend"
    custom_domain    = "sptribs-frontend.demo.platform.hmcts.net"
    dns_zone_name    = "demo.platform.hmcts.net"
    mode             = "Detection"
    backend_domain   = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-demo-platform-hmcts-net"
    global_exclusions = [
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "rf"
      },
    ]
  },
  {
    name           = "sscs-cor"
    mode           = "Detection"
    custom_domain  = "sscs-cor.demo.platform.hmcts.net"
    dns_zone_name  = "demo.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]
    global_exclusions = [
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
        selector       = "code"
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
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "question-field"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "describeTheEvidence"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_ga"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_gid"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_gat"
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
        selector       = "dtSa"
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
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "rf"
      }
    ]
  },
  {
    name           = "sscs-tribunals"
    custom_domain  = "benefit-appeal.demo.platform.hmcts.net"
    dns_zone_name  = "demo.platform.hmcts.net"
    mode           = "Detection"
    backend_domain = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]

    global_exclusions = [
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "session"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "__auth-token"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "__state"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "iss"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "code"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "reasonForNoMRN"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "reasonForBeingLate"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "nino"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "signer"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "selection.signLanguage.language"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "selection.anythingElse.language"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_ga"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_gid"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_gat"
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
        selector       = "dtSa"
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
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "rf"
      }
    ]
  },
  {
    product        = "idam"
    name           = "hmcts-access"
    mode           = "Detection"
    custom_domain  = "hmcts-access.demo.platform.hmcts.net"
    dns_zone_name  = "demo.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]

  },
  {
    name             = "idam-user-dashboard"
    custom_domain    = "idam-user-dashboard.demo.platform.hmcts.net"
    dns_zone_name    = "demo.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-demo-platform-hmcts-net"
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
    name           = "xui-approve-org-int"
    mode           = "Detection"
    custom_domain  = "administer-orgs-int.demo.platform.hmcts.net"
    dns_zone_name  = "demo.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]

  },
  {
    name           = "xui-manage-org-int"
    mode           = "Detection"
    custom_domain  = "manage-org-int.demo.platform.hmcts.net"
    dns_zone_name  = "demo.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]

  },
  {
    name           = "idam-web-public"
    custom_domain  = "idam-web-public.demo.platform.hmcts.net"
    dns_zone_name  = "demo.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]
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
    name                        = "idam-web-admin"
    custom_domain               = "idam-web-admin.demo.platform.hmcts.net"
    dns_zone_name               = "demo.platform.hmcts.net"
    backend_domain              = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]
    certificate_name            = "wildcard-demo-platform-hmcts-net"
    appgw_cookie_based_affinity = "Enabled"
    global_exclusions = [
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "activationRedirectUrl"
      },
      {
        match_variable = "RequestBodyPostArgNames",
        operator       = "Equals",
        selector       = "activationRedirectUrl"
      },
      {
        match_variable = "RequestBodyPostArgNames",
        operator       = "Equals",
        selector       = "description"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "dtSa"
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
        selector       = "oauth2ClientId"
      },
      {
        match_variable = "RequestBodyPostArgNames",
        operator       = "Equals",
        selector       = "oauth2ClientSecret"
      },
      {
        match_variable = "QueryStringArgNames",
        operator       = "Equals",
        selector       = "oauth2RedirectUris"
      },
      {
        match_variable = "RequestBodyPostArgNames",
        operator       = "Equals",
        selector       = "oauth2RedirectUris"
      },
      {
        match_variable = "RequestBodyPostArgNames",
        operator       = "StartsWith",
        selector       = "password"
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
    ]
  },
  {
    name           = "gateway-ccd"
    mode           = "Detection"
    custom_domain  = "gateway-ccd.demo.platform.hmcts.net"
    dns_zone_name  = "demo.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]

  },
  {
    name           = "gateway-ccd-int"
    mode           = "Detection"
    custom_domain  = "gateway-ccd-int.demo.platform.hmcts.net"
    dns_zone_name  = "demo.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]

  },
  {
    name           = "return-case-doc-ccd"
    mode           = "Detection"
    custom_domain  = "return-case-doc-ccd.demo.platform.hmcts.net"
    dns_zone_name  = "demo.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]

  },
  {
    name           = "return-case-doc-ccd-int"
    mode           = "Detection"
    custom_domain  = "return-case-doc-ccd-int.demo.platform.hmcts.net"
    dns_zone_name  = "demo.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]

  },
  {
    name           = "xui-webapp-ac-int"
    mode           = "Detection"
    custom_domain  = "manage-case-ac-int.demo.platform.hmcts.net"
    dns_zone_name  = "demo.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]

  },
  {
    name           = "xui-webapp-int"
    mode           = "Detection"
    custom_domain  = "manage-case-int.demo.platform.hmcts.net"
    dns_zone_name  = "demo.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]

  },
  {
    name           = "xui-webapp-caa-ac"
    mode           = "Detection"
    custom_domain  = "manage-case-caa-assigned-case-view.demo.platform.hmcts.net"
    dns_zone_name  = "demo.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]

  },
  {
    name           = "xui-webapp-hearings-int"
    mode           = "Detection"
    custom_domain  = "manage-case-hearings-int.demo.platform.hmcts.net"
    dns_zone_name  = "demo.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]
    cache_enabled  = "false"

  },
  {
    name           = "xui-register-org"
    mode           = "Detection"
    custom_domain  = "register-org.demo.platform.hmcts.net"
    dns_zone_name  = "demo.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]

  },
  {
    name           = "xui-approve-org"
    mode           = "Detection"
    custom_domain  = "administer-orgs.demo.platform.hmcts.net"
    dns_zone_name  = "demo.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]

  },
  {
    name           = "xui-manage-org"
    mode           = "Detection"
    custom_domain  = "manage-org.demo.platform.hmcts.net"
    dns_zone_name  = "demo.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]

  },
  {
    name           = "xui-webapp-int1"
    mode           = "Detection"
    custom_domain  = "manage-case-int1.demo.platform.hmcts.net"
    dns_zone_name  = "demo.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]

  },
  {
    name           = "xui-webapp-int2"
    mode           = "Detection"
    custom_domain  = "manage-case-int2.demo.platform.hmcts.net"
    dns_zone_name  = "demo.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]

  },
  {
    name           = "xui-webapp"
    mode           = "Detection"
    custom_domain  = "manage-case.demo.platform.hmcts.net"
    dns_zone_name  = "demo.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]
    cache_enabled  = "false"

  },
  {
    name           = "xui-webapp-srt"
    mode           = "Detection"
    custom_domain  = "manage-case-srt.demo.platform.hmcts.net"
    dns_zone_name  = "demo.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]

  },
  {
    name           = "xui-webapp-wa-int"
    mode           = "Detection"
    custom_domain  = "manage-case-wa-int.demo.platform.hmcts.net"
    dns_zone_name  = "demo.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]

  },
  {
    product          = "et-pet-et1"
    name             = "et-pet-et1"
    mode             = "Prevention"
    custom_domain    = "et-pet-et1.demo.platform.hmcts.net"
    dns_zone_name    = "demo.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-demo-platform-hmcts-net"
    global_exclusions = [
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "cookie_setting"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_app_session"
      },
    ]
  },
  {
    product          = "et-pet-et3"
    name             = "et-pet-et3"
    mode             = "Prevention"
    custom_domain    = "et-pet-et3.demo.platform.hmcts.net"
    dns_zone_name    = "demo.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-demo-platform-hmcts-net"
    global_exclusions = [
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "cookie_setting"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_app_session"
      },
    ]
  },
  {
    product          = "et-pet-admin"
    name             = "et-pet-admin"
    mode             = "Prevention"
    custom_domain    = "et-pet-admin.demo.platform.hmcts.net"
    dns_zone_name    = "demo.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-demo-platform-hmcts-net"
  },
  {
    product          = "tax-tribunals-datacapture"
    name             = "tax-tribunals-datacapture"
    custom_domain    = "tax-tribunals-datacapture.demo.platform.hmcts.net"
    dns_zone_name    = "demo.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-demo-platform-hmcts-net"
    global_exclusions = [
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_tax-tribunals-datacapture_session"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "cookie_setting"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_utma"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_utmb"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_utmc"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_utmz"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_ga"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "authenticity_token"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "address_lookup_url"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "StartsWith"
        selector       = "steps_closure_support_documents_form"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "StartsWith"
        selector       = "steps_details_documents_upload_form"
      }
    ]
  },
  {
    product          = "help-with-fees-publicapp"
    name             = "help-with-fees-publicapp"
    mode             = "Prevention"
    custom_domain    = "hwf-publicapp.demo.platform.hmcts.net"
    dns_zone_name    = "demo.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-demo-platform-hmcts-net"
    global_exclusions = [
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "cookie_setting"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_hwf-publicapp_session"
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
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "address_lookup_url"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "authenticity_token"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "notification[message]"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "commit"
      }
    ]
  },
  {
    product          = "help-with-fees-staffapp"
    name             = "help-with-fees-staffapp"
    mode             = "Prevention"
    custom_domain    = "hwf-staffapp.demo.platform.hmcts.net"
    dns_zone_name    = "demo.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-demo-platform-hmcts-net"
    global_exclusions = [
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "cookie_setting"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_fr-staffapp_session"
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
        selector       = "fr_username"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "homepage_visited_timestamp"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "address_lookup_url"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "authenticity_token"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "commit"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "user[name]"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "notification[message]"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "user[password]"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "user[password_confirmation]"
      }
    ]
  },
  {
    name           = "judicial-payments"
    mode           = "Detection"
    custom_domain  = "judicial-payments.demo.platform.hmcts.net"
    dns_zone_name  = "demo.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]
  },
  {
    product        = "cui"
    name           = "cui-ra"
    mode           = "Prevention"
    custom_domain  = "cui-ra.demo.platform.hmcts.net"
    dns_zone_name  = "demo.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"],
    global_exclusions = [
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "cui-session"
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
        selector       = "dtSa"
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
        selector       = "rf"
      },
    ]
  }
]

