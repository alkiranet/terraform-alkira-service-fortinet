variable "name" {
  description = "Service name"
  type        = string
}

variable "cxp" {
  description = "Alkira CXP to provision service in"
  type        = string
}

variable "size" {
  description = "Alkira service size"
  type        = string
  default     = "SMALL"
}

variable "segments" {
  description = "List of segments to associate with the service"
  type        = list(string)
}

variable "mgmt_segment" {
  description = "Management segment"
  type        = string
}

variable "mgmt_server_ip" {
  description = "Management segment"
  type        = string
  default     = ""
}

variable "fw_version" {
  description = "Fortigate version"
  type        = string
  default     = "7.0.3"
}

variable "auto_scale" {
  description = "Enable autoscale"
  type        = string
  default     = "OFF"
}

variable "max_instance_count" {
  description = "Maximum number of instances for auto-scale"
  type        = number
  default     = 1
}

variable "min_instance_count" {
  description = "Minimum number of instances for auto-scale"
  type        = number
  default     = 1
}

variable "tunnel_protocol" {
  description = "Tunnel protocol"
  type        = string
  default     = "IPSEC"
}

variable "license_type" {
  type        = string
  default     = "PAY_AS_YOU_GO"
}

variable "username" {
  description = "Fortinet username"
  type        = string
}

variable "password" {
  description = "Fortinet password"
  type        = string
  sensitive   = true
}

variable "instances" {
  description = "Configuration for FortiGate instances"

  type = list(object({
    name                   = string
    license_key            = optional(string)
    license_key_file_path  = optional(string)
    serial_number          = optional(string)
  }))
}

variable "zones" {
  description = "Zone values; maps Alkira segments + groups to FortiGate Zones"

  type = list(object({
    name     = optional(string)
    groups   = optional(list(string))
    segment  = optional(string)
  }))
  default = []
}