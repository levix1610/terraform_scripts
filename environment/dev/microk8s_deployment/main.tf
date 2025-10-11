# Terraform deployment file for deploying my test microk8s clustercheck


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
    endpoint            = "https://10.0.250.70:8006/"
    api_token           = "${var.test_api_token_id}=${var.test_api_token_secret}"
    insecure            = true
}

# ------------------------------------------------------------------
# 2. MODULE BLOCK
#    (Calls your core microk8s logic)
# ------------------------------------------------------------------

    module "microk8s_deployment" {
    # This tells Terraform where your core logic is located
    source = "../../../microk8s_cluster"


    # Pass all required variables from the Root Module to the Child Module.
    # The values for these variables (e.g., k8s_cluster_nodes) 
    # will come from your dev.tfvars.
    # Define Other variables needed for VMs for Dev Env
    
     # Complex Variable:
    k8s_cluster_nodes   = var.k8s_cluster_nodes
    
    # Simple Variables:
    proxmox_node        = var.proxmox_node
    ssh_pub_file        = var.ssh_pub_file
    template_id         = var.template_id
    vm_datastore        = var.vm_datastore
    vlan_id_primary     = var.vlan_id_primary
    vlan_id_secondary   = var.vlan_id_secondary
    
    # API Credentials (passing the values received from TF_VAR_... env vars):
    api_token_id        = var.test_api_token_id
    api_token_secret    = var.test_api_token_secret
    
    # ... include all other variables required by the microk8s_cluster module
}