# Main Logic Block to create a generic Proxmox Virtual Machine (with injected variables) to be used for any application. 

resource "proxmox_virtual_environment_vm" "generic_vm_module" {
    vm_id               = var.vm_id
    node_name           = var.proxmox_node
    name                = var.vm_name
    
    clone {
        vm_id           = var.template_id # VM ID of the template
        full            = true
    }
    
    cpu {
      cores             = var.cpu_cores
    }
    
    memory {
      dedicated         = var.memory
    }

    disk {
        datastore_id    = var.vm_datastore
        interface       = "scsi0"
        size            = var.disk_size
        discard         = "on"
        ssd             = true
    }
    
    network_device {
        bridge          = "vmbr1"
        mac_address     = var.mac_address
        vlan_id         = var.vlan_id
        firewall        = true
    }

     # Config for Cloud-Init settings to inject SSH key
    initialization {

        # User to add the ssh key for
        user_account {
            username    = "levix"
            keys        = [
                file(var.ssh_pub_file) # SSH pub file key
            ]
        }
    }

  
}


