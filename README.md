# Alkira Service Fortinet - Terraform Module
This module makes it easy to provision Fortinet service in Alkira.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_alkira"></a> [alkira](#requirement\_alkira) | >= 0.9.6 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alkira"></a> [alkira](#provider\_alkira) | >= 0.9.6 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [alkira_service_fortinet.service](https://registry.terraform.io/providers/alkiranet/alkira/latest/docs/resources/service_fortinet) | resource |
| [alkira_segment.mgmt](https://registry.terraform.io/providers/alkiranet/alkira/latest/docs/data-sources/segment) | data source |
| [alkira_segment.service](https://registry.terraform.io/providers/alkiranet/alkira/latest/docs/data-sources/segment) | data source |
| [alkira_segment.zone](https://registry.terraform.io/providers/alkiranet/alkira/latest/docs/data-sources/segment) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auto_scale"></a> [auto\_scale](#input\_auto\_scale) | Enable autoscale | `string` | `"OFF"` | no |
| <a name="input_cxp"></a> [cxp](#input\_cxp) | Alkira CXP to provision service in | `string` | n/a | yes |
| <a name="input_fw_version"></a> [fw\_version](#input\_fw\_version) | Fortigate version | `string` | `"7.0.3"` | no |
| <a name="input_instances"></a> [instances](#input\_instances) | Configuration for FortiGate instances | <pre>list(object({<br>    name                   = string<br>    license_key            = optional(string)<br>    license_key_file_path  = optional(string)<br>    serial_number          = optional(string)<br>  }))</pre> | n/a | yes |
| <a name="input_license_type"></a> [license\_type](#input\_license\_type) | n/a | `string` | `"PAY_AS_YOU_GO"` | no |
| <a name="input_max_instance_count"></a> [max\_instance\_count](#input\_max\_instance\_count) | Maximum number of instances for auto-scale | `number` | `1` | no |
| <a name="input_mgmt_segment"></a> [mgmt\_segment](#input\_mgmt\_segment) | Management segment | `string` | n/a | yes |
| <a name="input_mgmt_server_ip"></a> [mgmt\_server\_ip](#input\_mgmt\_server\_ip) | Management segment | `string` | `""` | no |
| <a name="input_min_instance_count"></a> [min\_instance\_count](#input\_min\_instance\_count) | Minimum number of instances for auto-scale | `number` | `1` | no |
| <a name="input_name"></a> [name](#input\_name) | Service name | `string` | n/a | yes |
| <a name="input_password"></a> [password](#input\_password) | Fortinet password | `string` | n/a | yes |
| <a name="input_segments"></a> [segments](#input\_segments) | List of segments to associate with the service | `list(string)` | n/a | yes |
| <a name="input_size"></a> [size](#input\_size) | Alkira service size | `string` | `"SMALL"` | no |
| <a name="input_tunnel_protocol"></a> [tunnel\_protocol](#input\_tunnel\_protocol) | Tunnel protocol | `string` | `"IPSEC"` | no |
| <a name="input_username"></a> [username](#input\_username) | Fortinet username | `string` | n/a | yes |
| <a name="input_zones"></a> [zones](#input\_zones) | Zone values; maps Alkira segments + groups to FortiGate Zones | <pre>list(object({<br>    name     = optional(string)<br>    groups   = optional(list(string))<br>    segment  = optional(string)<br>  }))</pre> | `[]` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->