variable "pm_api_url" {
  type        = string
  description = "Proxmox API URL, e.g. https://router1:8006/api2/json"
}

variable "pm_api_token_id" {
  type        = string
  description = "Proxmox API token ID, e.g. gitops@pve!terraform"
  sensitive   = true
}

variable "pm_api_token_secret" {
  type        = string
  description = "Proxmox API token secret"
  sensitive   = true
}

variable "pm_node" {
  type        = string
  description = "Name of Proxmox node that hosts the router and the OpenWRT template"
}

# Параметры боевого роутер-VM

variable "router_vm_vmid" {
  type        = number
  default     = 101
  description = "VMID for main OpenWRT router VM"
}

variable "router_vm_name" {
  type        = string
  default     = "router-openwrt-main"
  description = "Name of OpenWRT router VM"
}

variable "router_vm_memory_mb" {
  type        = number
  default     = 512
  description = "Memory size for router VM in MiB"
}

variable "router_vm_cores" {
  type        = number
  default     = 2
  description = "Number of vCPU cores for router VM"
}

variable "wan_bridge" {
  type        = string
  default     = "vmbr_wan"
  description = "Bridge name for WAN interface"
}

variable "lan_bridge" {
  type        = string
  default     = "vmbr_lan_trunk"
  description = "Bridge name for LAN trunk interface"
}

variable "template_name" {
  type        = string
  default     = "tpl-openwrt-23.05.5"
  description = "Name of the OpenWRT template VM in Proxmox"
}

variable "template_node" {
  type        = string
  description = "Node name where the OpenWRT template lives (can be same as pm_node)"
}

