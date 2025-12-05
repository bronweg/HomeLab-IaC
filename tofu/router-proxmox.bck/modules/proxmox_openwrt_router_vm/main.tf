resource "proxmox_vm_qemu" "router" {
  name        = var.router_vm_name
  vmid        = var.router_vm_vmid
  target_node = var.pm_node

  # Clone the template
  clone      = var.template_name
  full_clone = true

  # CPU / RAM
  cores   = var.router_vm_cores
  sockets = 1
  memory  = var.router_vm_memory_mb

  onboot = true

  # Network Interfaces
  network {
    model    = "virtio"
    bridge   = var.wan_bridge
    firewall = true
  }

  network {
    model    = "virtio"
    bridge   = var.lan_bridge
    firewall = true
  }
}

