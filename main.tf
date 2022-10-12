locals {

  segment_id_list = [
    for v in data.alkira_segment.service : v.id
  ]

  filter_zone_segments = var.zones[*].segment

}

data "alkira_segment" "service" {
  for_each = toset(var.segments)
  name     = each.key
}

data "alkira_segment" "mgmt" {
  name = var.mgmt_segment
}

data "alkira_segment" "zone" {
  for_each = toset(local.filter_zone_segments)
  name     = each.key
}

resource "alkira_service_fortinet" "service" {

  # service
  name                          = var.name
  cxp                           = var.cxp
  size                          = var.size
  version                       = var.fw_version
  segment_ids                   = local.segment_id_list
  management_server_ip          = var.mgmt_server_ip
  management_server_segment_id  = data.alkira_segment.mgmt.id
  tunnel_protocol               = var.tunnel_protocol
  username                      = var.username
  password                      = var.password

  # credentials + licensing
  license_type                  = var.license_type

  # auto-scale
  auto_scale                    = var.auto_scale
  max_instance_count            = var.max_instance_count
  min_instance_count            = var.min_instance_count

  # handle nested schema for instances
  dynamic "instances" {
    for_each = {
      for instance in var.instances : instance.name => instance
    }

    content {
      name                   = instances.value.name
      license_key_file_path  = file(instances.value.license_key_file_path)
      serial_number          = instances.value.serial_number
    }

  }

  # handle nested schema for zone-to-group mappings
  dynamic "segment_options" {
    for_each = {
      for o in var.zones : o.name => o
    }

    content {
      zone_name  = segment_options.value.name
      groups     = segment_options.value.groups
      segment_id = lookup(data.alkira_segment.zone, segment_options.value.segment).id
    }

  }

}