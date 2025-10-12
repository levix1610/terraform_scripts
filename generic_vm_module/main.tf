resource "proxmox_virtual_environment_vm" "vmus-test-k8s-01" {
    vm_id               = 1010060 # assigns the VM ID - Commented out for now during testing.
    node_name           = var.proxmox_node
    name                = "vmus-test-k8s-01"
    
    clone {
        vm_id           = var.template_id # VM ID of the template
        full            = true
    }
    
    cpu {
      cores             = 4
    }
    
    memory {
      dedicated         = 4096
    }
    
    disk {
        datastore_id    = var.vm_datastore
        interface       = "scsi0"
        size            = 30
        discard         = "on"
        ssd             = true
    }
    
    # Test Server VLAN NIC
    network_device {
        bridge          = "vmbr1"
        mac_address     = "BC:24:11:ED:F6:33"
        vlan_id         = 100
        firewall        = true
    }

     # Config for Cloud-Init settings to inject SSH key
    initialization {

        # User to add the ssh key for
        user_account {
            username    = "levix"
            keys        = [
                file(var.ssh_pub_file) # microk8s pub key file.
            ]
        }
    }

  
}
