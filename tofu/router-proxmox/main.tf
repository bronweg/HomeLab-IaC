terraform {
  required_version = ">= 1.10.7"

  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "~> 0.88.0"
    }
    sops = {
      source  = "carlpett/sops"
      version = "~> 1.3.0"
    }
  }
}

provider "sops" {}

# Read SOPS-encrypted file (contents WILL end up in state with data source)
data "sops_file" "router_api" {
  # Path to the same SOPS file that Ansible uses
  source_file = "${path.module}/../../ansible/inventory/group_vars/${var.proxmox_cluster_name}.sops.yml"
}

locals {
  # Decrypt YAML and pull proxmox_api dict
  router_api_yaml = yamldecode(data.sops_file.router_api.raw)
  proxmox_api     = local.router_api_yaml.proxmox_api
}

provider "proxmox" {
  endpoint = local.proxmox_api.url

  # api_token format: "<user>!<tokenid>=<tokensecret>"
  api_token = "${local.proxmox_api.user}!${local.proxmox_api.tokens.terraform.token_id}=${local.proxmox_api.tokens.terraform.token_secret}"

  # Internal Proxmox with self-signed TLS
  insecure = true
}

resource "proxmox_virtual_environment_vm" "router" {
  name        = var.router_vm_name
  description = "OpenWRT main router managed by OpenTofu"
  node_name   = var.proxmox_node_name
  vm_id       = var.router_vm_vmid

  tags = [
    "router",
    "openwrt",
    "tofu"
  ]

  # Clone from existing OpenWRT template VM
  clone {
    vm_id     = var.openwrt_template_vmid
    full      = true
    node_name = var.openwrt_template_node_name
  }

  cpu {
    cores   = var.router_vm_cores
    sockets = 1
    type    = "host"
  }

  memory {
    dedicated = var.router_vm_memory_mb
  }

  # NIC 0 — WAN
  network_device {
    bridge = var.wan_bridge
    model  = "virtio"
  }

  # NIC 1 — LAN trunk
  network_device {
    bridge = var.lan_bridge
    model  = "virtio"
  }

  on_boot = true

  serial_device {
    device = "socket"
  }
}

resource "local_file" "ansible_inventory_router" {
  filename = "${path.module}/../../ansible/inventory/management/management.yml"

  content = yamlencode({
    all = {
      children = {
        management = {
          hosts = {
            (var.router_vm_name) = {
              ansible_host = var.openwrt_lan_ipaddr
              ansible_user = "root"
            }
          }
        }
      }
    }
  })

  file_permission = "0644"

  depends_on = [
    proxmox_virtual_environment_vm.router
  ]
}
