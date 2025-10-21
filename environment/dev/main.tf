# This is the main driver to build a generic Virtual Machine for any kind of use

# ------------------------------------------------------------------
# 1. PROVIDER CONFIGURATION
# ------------------------------------------------------------------
terraform {
    required_providers {
      proxmox = {
        source = "bpg/proxmox"
      }
    }
}

# Connection/communication to the server
provider "proxmox" {
    endpoint            = "https://10.0.250.71:8006/"
    api_token           = "${var.test_api_token_id}=${var.test_api_token_secret}"
    insecure            = true
}

# ------------------------------------------------------------------
# 2. MODULE BLOCK
#    (Calls the generic_vm_modules)
# ------------------------------------------------------------------

    module "generic_vm_module" {
    # This tells Terraform where your core logic is located
    source = "../../generic_vm_module"


    # Pass all required variables from the Root Module to the Child Module.
    # will come from your .tfvars files.
    # Define Other variables needed for VMs.
    
     # Complex Variable:
    
    
    # Simple Variables:
    proxmox_node        = var.proxmox_node
    ssh_pub_file        = var.ssh_pub_file
    template_id         = var.template_id
    vm_datastore        = var.vm_datastore
    vlan_id             = var.vlan_id
    vm_name             = var.vm_name
    mac_address         = var.mac_address
    cpu_cores           = var.cpu_cores
    disk_size           = var.disk_size
    vm_id               = var.vm_id
    memory              = var.memory
    
    # API Credentials (passing the values received from TF_VAR_... env vars):
    api_token_id        = var.test_api_token_id
    api_token_secret    = var.test_api_token_secret
    
    # ... include all other variables required by the microk8s_cluster module
}