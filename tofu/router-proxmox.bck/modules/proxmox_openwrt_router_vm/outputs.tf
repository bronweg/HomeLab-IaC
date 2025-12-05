output "router_vmid" {
  value       = proxmox_vm_qemu.router.vmid
  description = "VMID of the router VM"
}

output "router_name" {
  value       = proxmox_vm_qemu.router.name
  description = "Name of the router VM"
}

