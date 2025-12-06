variable "proxmox_cluster_name" {
  type        = string
  description = "Name of Proxmox cluster where router VM will run"
}

variable "proxmox_node_name" {
  type        = string
  description = "Name of Proxmox node where router VM will run"
}

variable "openwrt_template_vmid" {
  type        = number
  description = "VMID of the OpenWRT template"
}

variable "openwrt_template_node_name" {
  type        = string
  description = "Node name where the OpenWRT template resides"
}

variable "openwrt_template_name" {
  type        = string
  description = "Name of the OpenWRT template VM"
}

variable "router_vm_vmid" {
  type        = number
  description = "VMID for the main router VM"
}

variable "router_vm_name" {
  type        = string
  description = "Name for the main router VM"
}

variable "router_vm_memory_mb" {
  type        = number
  description = "Dedicated RAM for router VM in MB"
}

variable "router_vm_cores" {
  type        = number
  description = "Number of CPU cores for router VM"
}

variable "wan_bridge" {
  type        = string
  description = "Proxmox bridge for WAN interface"
}

variable "lan_bridge" {
  type        = string
  description = "Proxmox bridge for LAN trunk interface"
}

variable "openwrt_lan_ipaddr" {
  type        = string
  description = "LAN (management VLAN) IP address of the router (OpenWRT)"
}