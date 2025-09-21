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
    api_token           = "levix@pve!terraform=014f8653-7e65-406d-8cb0-375504bc8764"  # User and api key token.
    insecure            = true
  
}