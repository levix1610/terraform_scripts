# Terraform deployment file for deploying my test microk8s clustercheck
# Timeouts not supported from what I can find.  Suggest running as terraform apply -parallelism=1 if it fails

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
    api_token           = "${var.api_token_id}=${var.api_token_secret}"
    insecure            = true
}