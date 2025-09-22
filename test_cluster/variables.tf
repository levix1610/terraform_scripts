# Variables for test Microk8s cluster terraform scripts

variable "proxmox_node" {
  type        = string
  description = "The Proxmox node to deploy the VM to."
  default     = "pmx-test-gr-01"
}

variable "ssh_pub_file" {
  type        = string
  description = "Path to the public SSH key file"
  default     = "~/.ssh/microk8s_test_key.pub"
}

variable "template_id" {
  type        = number
  description = "The VMID of the golden image template to clone from."
  default     = 800
}

variable "vm_datastore" {
  type        = string
  description = "The Proxmox datastore to store the VM disk."
  default     = "NNMe_01"
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