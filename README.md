# azure-platform-terraformM
All things terraform

## Pre-commit Installation
This repository has been configured with pre-commit hooks. To install pre-commit see its [installation guide](https://pre-commit.com/#installation)

For this repository you will also need these dependencies: 

- [terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)
- [yq](https://github.com/mikefarah/yq#install)


## Frontdoor

To setup a basic Frontdoor configuration, go to the required environment within `environments` folder and edit the environments `tfvars` file

Within the variable `frontends` add the basic object to the array:
```terraform
{
  name              = "{Sub-Domain Name}"
  custom_domain     = "{URL}"
  backend_domain    = ["{Backend URL or Firewall}"]
  disabled_rules    = {}
  global_exclusions = []
}
```

### WAF Exclusions
If you have blocks on the Web Application Firewall(WAF) you may want to exclude them to allow traffic.
Please first see if the block is really required to exclude and if there is an alternative route first to keep as much protection in place.

To exclude add the parameter `global_exclusions`, which is an array of exclusions.
Each exclusion is formatted as:
```terraform
{
  match_variable = "BLOCK TYPE"
  operator       = "OPERATOR"
  selector       = "VALUE"
}
```

`BLOCK TYPE` 
| Variable | Description |
| -- | -- |
| RequestCookieNames | Cookie Name |
| QueryStringArgNames | Query String Argument |
| RequestBodyPostArgNames | Property within the Request Body |
| RequestHeaderNames | Header Parameter Name |

`OPERATOR`
| Operator | Description |
| -- | -- |
| Equals | Matches value |
| StartsWith | Starts with string |
| EndsWith | Ends with string |
| Contains | Contains String |

`VALUE` 
string being blocked.

### TLS
By default it will use the Azure Frontdoor Managed Certificates, which will validate the URL against the DNS within the tenant then generate a certificate.

If you would like to use a certificate from the ACME Key Vaults managed by Platform Operations, then you can add the following properties:
```terraform
{
  certificate_name = "{Certificate Name}"
  ssl_mode         = "AzureKeyVault"
}
```

## Shutter Pattern
You can get more detail from [shutter-implementation-and-design](https://hmcts.github.io/cloud-native-platform/path-to-live/shutter.html)


### TLS
The shuttering service currently requires an ACME certificate, you will need to add the `certificate_name` field:
```terraform
{
  certificate_name = "{Certificate Name}"
}
```

## Custom Data Updates
Please note that custom_data updates will cause VMs to restart.

For example updates to [cloudconfig-private.tpl](https://github.com/hmcts/azure-platform-terraform/blob/master/modules/dynatrace-activegate/cloudconfig-private.tpl) & [cloudconfig.tpl](https://github.com/hmcts/azure-platform-terraform/blob/master/modules/dynatrace-activegate/cloudconfig.tpl)
