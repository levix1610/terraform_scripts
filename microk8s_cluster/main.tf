resource "proxmox_virtual_environment_vm" "k8s_cluster_nodes" {
  for_each  = var.k8s_cluster_nodes


  # Node-specific properties
  vm_id     = each.value.vmid
  name      = each.value.name

  # Common properties from module inputs
  node_name = var.proxmox_node
  
  clone {
    vm_id = var.template_id
    full  = true
  }

  cpu { cores = 4 }
  memory { dedicated = 4096 }

  disk {
    datastore_id = var.vm_datastore
    interface    = "scsi0"
    size         = 30
    discard      = "on"
    ssd          = true
  }

  # Network Device 1: K8s Data VLAN (Primary)
  network_device {
    bridge      = "vmbr1"
    mac_address = each.value.prime_nic
    vlan_id     = var.vlan_id_primary
    firewall    = true
  }

  # Network Device 2: K8s Data VLAN (Secondary) - Conditional
  dynamic "network_device" {
    for_each = each.value.sec_nic != null ? [1] : []
    content {
      bridge      = "vmbr1"
      mac_address = each.value.sec_nic
      vlan_id     = var.vlan_id_secondary
      firewall    = true
    }
  }

  initialization {
    user_account {
      username = "levix"
      keys     = [
        file(var.ssh_pub_file)
      ]
    }
  }
}