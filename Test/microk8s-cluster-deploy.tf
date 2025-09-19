# Terraform deployment file for deploying my test microk8s clustercheck

# State the provider we need for the deployment
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
    #vm_id               = 1010060 # assigns the VM ID - Commented out for now during testing.
    node_name           = "pmx-test-gr-01"
    name                = "vmus-test-k8s-01"
    

    timeouts {
        create = "5m" # This gives Terraform 5 minutes to create the VM
    }

    clone {
        vm_id           = "150" # VM ID of the template
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
    }

     # Config for Cloud-Init settings to inject SSH key
    initialization {
        # Add Hostname
        #hostname = "vmus-test-k8s-01"

        # User to add the ssh key for
        user_account {
            username    = "levix"
            keys        = [
                "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIF/Qmop0kZHeRThFvDx0y4uKxkNsgnpYjAv1jRPrVLsv" # microk8s test pub key
            ]
        }
    }

  
}

# Second VM of the cluster

resource "proxmox_virtual_environment_vm" "vmus-test-k8s-02" {
    #vm_id               = 1010061 # assigns the VM ID - Commented out for now during testing.
    node_name           = "pmx-test-gr-01"
    name                = "vmus-test-k8s-02"
    
    clone {
        vm_id           = "150" # VM ID of the template
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
        mac_address     = "BC:24:11:3A:06:E0"
        vlan_id         = 100
    }

    # Config for Cloud-Init settings to inject SSH key
    initialization {
        # Add Hostname
        #hostname = "vmus-test-k8s-02"

        # User to add the ssh key for
        user_account {
            username    = "levix"
            keys        = [
                "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIF/Qmop0kZHeRThFvDx0y4uKxkNsgnpYjAv1jRPrVLsv" # microk8s test pub key
            ]
        }
    }

    timeouts {
        create = "5m" # This gives Terraform 5 minutes to create the VM
    }
  
}

# Third VM of the cluster

resource "proxmox_virtual_environment_vm" "vmus-test-k8s-03" {
    #vm_id               = 1010062 # assigns the VM ID - Commented out for now during testing.
    node_name           = "pmx-test-gr-01"
    name                = "vmus-test-k8s-03"
    
    clone {
        vm_id           = "150" # VM ID of the template
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
        mac_address     = "BC:24:11:AA:36:5F"
        vlan_id         = 100
    }

    # Config for Cloud-Init settings to inject SSH key
    initialization {
        # Add Hostname
        #hostname = "vmus-test-k8s-03"

        # User to add the ssh key for
        user_account {
            username    = "levix"
            keys        = [
                "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIF/Qmop0kZHeRThFvDx0y4uKxkNsgnpYjAv1jRPrVLsv" # microk8s test pub key
            ]
        }
    }

    timeouts {
        create = "5m" # This gives Terraform 5 minutes to create the VM
    }
  
}

# Fourth VM of the cluster - Worker Only Node

resource "proxmox_virtual_environment_vm" "vmus-test-k8s-04" {
    #vm_id               = 1010063 # assigns the VM ID - Commented out for now during testing.
    node_name           = "pmx-test-gr-01"
    name                = "vmus-test-k8s-04"
    
    clone {
        vm_id           = "150" # VM ID of the template
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
        mac_address     = "BC:24:11:0D:E4:D1"
        vlan_id         = 100
    }

    # MGMT VLAN NIC
    network_device {
        bridge          = "vmbr1"
        mac_address     = "BC:24:11:B2:54:72"
        vlan_id         = 250
    }


    # Config for Cloud-Init settings to inject SSH key
    initialization {
        # Add Hostname
        #hostname = "vmus-test-k8s-04"

        # User to add the ssh key for
        user_account {
            username    = "levix"
            keys        = [
                "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIF/Qmop0kZHeRThFvDx0y4uKxkNsgnpYjAv1jRPrVLsv" # microk8s test pub key
            ]
        }
    }

    timeouts {
        create = "5m" # This gives Terraform 5 minutes to create the VM
    }
  
}

# Fifth VM of the Cluster - Worker Only Node
resource "proxmox_virtual_environment_vm" "vmus-test-k8s-05" {
    #vm_id               = 1010064 # assigns the VM ID - Commented out for now during testing.
    node_name           = "pmx-test-gr-01"
    name                = "vmus-test-k8s-05"
    
    clone {
        vm_id           = "150" # VM ID of the template
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
        mac_address     = "BC:24:11:2D:57:09"
        vlan_id         = 100
    }

    # MGMT VLAN NIC
    network_device {
        bridge          = "vmbr1"
        mac_address     = "BC:24:11:D8:D0:29"
        vlan_id         = 250
    }


    # Config for Cloud-Init settings to inject SSH key
    initialization {
        # Add Hostname
        #hostname = "vmus-test-k8s-05"

        # User to add the ssh key for
        user_account {
            username    = "levix"
            keys        = [
                "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIF/Qmop0kZHeRThFvDx0y4uKxkNsgnpYjAv1jRPrVLsv" # microk8s test pub key
            ]
        }
    }

    timeouts {
        create = "5m" # This gives Terraform 5 minutes to create the VM
    }
  
}