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

provider "vault" {
  address = "https://10.0.100.80:8200"
  token   = var.vault_token
  
}

data "vault_generic_secret" "database" {
  path = "cubbyhole/secret/terraform"
}

# Connection/communication to the server
provider "proxmox" {
    endpoint            = "https://10.0.250.70:8006/"
    api_token           = "${var.api_token_id}=${var.api_token_secret}"
    insecure            = true
}