# Terraform deployment file for deploying my test microk8s clustercheck
# Timeouts not supported from what I can find.  Suggest running as terraform apply -parallelism=1

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
    pm_api_token_id     = var.api_token_id
    pm_api_token_secret = var.api_token_secret
    insecure            = true
}