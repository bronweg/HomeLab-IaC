output "router_vm_id" {
  description = "Proxmox VMID of the router"
  value       = proxmox_virtual_environment_vm.router.vm_id
}

output "router_vm_name" {
  description = "Name of the router VM"
  value       = proxmox_virtual_environment_vm.router.name
}

output "router_node" {
  description = "Proxmox node name where router VM runs"
  value       = proxmox_virtual_environment_vm.router.node_name
}

output "router_ipv4_addresses" {
  description = "IPv4 addresses of router VM per interface"
  value       = proxmox_virtual_environment_vm.router.ipv4_addresses
}
