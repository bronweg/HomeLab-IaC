module "openwrt_router_vm" {
  source = "./modules/proxmox_openwrt_router_vm"

  pm_node       = var.pm_node
  template_node = var.template_node

  template_name = var.template_name

  router_vm_vmid      = var.router_vm_vmid
  router_vm_name      = var.router_vm_name
  router_vm_memory_mb = var.router_vm_memory_mb
  router_vm_cores     = var.router_vm_cores

  wan_bridge = var.wan_bridge
  lan_bridge = var.lan_bridge
}

