# ------------------------------------------------------------------
# PROVIDER CONFIGURATION
# ------------------------------------------------------------------
terraform {
    required_providers {
      proxmox = {
        source = "bpg/proxmox"
      }
    }
}

provider "proxmox" {
  # This parameter overrides the default API timeout (usually 60s).
  # 300 seconds = 5 minutes, allowing Proxmox API time to respond
  # when the host is heavily loaded during concurrent VM creation.
  api_timeout = 300 
}