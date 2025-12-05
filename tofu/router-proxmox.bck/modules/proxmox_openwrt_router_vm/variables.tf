variable "pm_node" {
  type        = string
  description = "Proxmox node name where router VM will live"
}

variable "template_node" {
  type        = string
  description = "Node where OpenWRT template resides"
}

variable "template_name" {
  type        = string
  description = "Name of OpenWRT template VM"
}

variable "router_vm_vmid" {
  type        = number
  description = "VMID of router VM"
}

variable "router_vm_name" {
  type        = string
  description = "Name of router VM"
}

variable "router_vm_memory_mb" {
  type        = number
  description = "Memory size for router VM"
}

variable "router_vm_cores" {
  type        = number
  description = "Number of vCPU cores"
}

variable "wan_bridge" {
  type        = string
  description = "WAN bridge name"
}

variable "lan_bridge" {
  type        = string
  description = "LAN trunk bridge name"
}

