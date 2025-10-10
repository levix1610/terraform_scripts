# variable to hold all vm details

variable "k8s_cluster_nodes" {
  description = "Configuration map for all K8s test cluster nodes."
  type = map(object({
    vmid        = number
    name        = string
    prime_nic   = string # VLAN 100 Mac
    sec_nic     = optional(string) # VLAN 250 Mac (Worker nodes only)
  }))
  default = {
    "vmus-k8s-01" = { vmid = 1010060, name = "vmus-test-k8s-01", prime_nic = "BC:24:11:ED:F6:33" },
    "vmus-k8s-02" = { vmid = 1010061, name = "vmus-test-k8s-02", prime_nic = "BC:24:11:3A:06:E0" },
    "vmus-k8s-03" = { vmid = 1010062, name = "vmus-test-k8s-03", prime_nic = "BC:24:11:AA:36:5F" },
    "vmus-k8s-04" = { vmid = 1010063, name = "vmus-test-k8s-04", prime_nic = "BC:24:11:0D:E4:D1", sec_nic = "BC:24:11:B2:54:72" },
    "vmus-k8s-05" = { vmid = 1010064, name = "vmus-test-k8s-05", prime_nic = "BC:24:11:2D:57:09", sec_nic = "BC:24:11:D8:D0:29" }
  }
}

# Define Other variables needed for VMs for Dev Env
proxmox_node = "pmx-test-gr-01"
ssh_pub_file = "~/.ssh/microk8s_test_key.pub"
template_id = 800
vm_datastore = "NNMe_01"
# Env variables for API Details
api_token_id = TF_VAR_test_api_token_id
api_token_secret = TF_VAR_test_api_token_secret
