# Variables for test Microk8s cluster terraform scripts

variable "k8s_cluster_nodes" {
  description = "Configuration map for all K8s test cluster nodes."
  type = map(object({
    vmid        = number
    name        = string
    prime_nic   = string # Primary NIC
    sec_nic     = optional(string) # Secondary NIC (Worker nodes only)
  }))
}

variable "proxmox_node" {
  type        = string
  description = "The Proxmox node to deploy the VM to."
}

variable "ssh_pub_file" {
  type        = string
  description = "Path to the public SSH key file"
}

variable "template_id" {
  type        = number
  description = "The VMID of the golden image template to clone from."
}

variable "vm_datastore" {
  type        = string
  description = "The Proxmox datastore to store the VM disk."
}

variable "vlan_id_primary" {
  type        = number
  description = "VLAN ID of the NIC for first primary Network"
}

variable "vlan_id_secondary" {
  type        = number
  description = "VLAN ID of the NIC for the secondary (worker) Network"
}

variable "api_token_id" {
  type        = string
  description = "The Proxmox API token ID."
}

variable "api_token_secret" {
  type        = string
  description = "The Proxmox API token secret."
  sensitive   = true
}