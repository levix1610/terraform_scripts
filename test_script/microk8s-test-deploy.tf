# Terraform deployment file for server ONE of the K8s cluster for testing.
# Just to run and build 01 of the cluster to make sure all the running code works.

terraform {
    required_providers {
      proxmox = {
        source = "bpg/proxmox"
      }
    }
}

# Connection/communication to the server
provider "proxmox" {
    endpoint            = "https://10.0.250.70:8006/"
    api_token           = "levix@pve!terraform=014f8653-7e65-406d-8cb0-375504bc8764"  # User and api key token.
    insecure            = true
  
}

# Define the resources that will be provisioned

# First VM of the cluster

resource "proxmox_virtual_environment_vm" "vmus-test-k8s-01" {
    vm_id               = 1010060 # assigns the VM ID - Commented out for now during testing.
    node_name           = "pmx-test-gr-01"
    name                = "vmus-test-k8s-01"
    
    clone {
        vm_id           = "800" # VM ID of the template. Trying with a modified version.
        full            = true
    }
    
    cpu {
      cores             = 4
    }
    
    memory {
      dedicated         = 4096
    }
    
    disk {
        datastore_id    = "NNMe_01"
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
            cloud_init_yaml = <<-EOT
                #cloud-config
                    network:
                        version: 2
                        ethernets:
                            eth0:
                                dhcp4: true
                                dhcp6: false
                                accept-ra: false
                                ipv6-disable: true
            EOT

        # User to add the ssh key for
        user_account {
            username    = "levix"
            keys        = [
                "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIF/Qmop0kZHeRThFvDx0y4uKxkNsgnpYjAv1jRPrVLsv" # microk8s test pub key
            ]
        }

    }   

}

  