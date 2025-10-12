# Variables for generic_vm_module


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
  description = "VLAN ID of the NIC for the secondary Network"
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