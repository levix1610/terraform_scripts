# Variables for generic_vm_module


variable "proxmox_node" {
  type        = string
  description = "The Proxmox node to deploy the VM to."
}

variable "vm_id" {
  type        = number
  description = "Virtual Machine Proxmox ID number."
  
}
variable "vm_name" {
  type        = string
  description = "The name of the Virtual Machine."
}

variable "cpu_cores" {
  type        = number
  description = "The amount of virtual CPU cores."
  
}

variable "memory" {
  type        = number
  description = "Amount of memory you want to give."
}

variable "mac_address" {
  type        = string
  description = "The mac address of said Virtual Machine."
}

variable "disk_size" {
  type        = number
  description = "Virtual Disk Size."
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

variable "vlan_id" {
  type        = number
  description = "VLAN ID of the NIC."
}

variable "prod_api_token_id" {
  type        = string
  description = "The Proxmox API token ID."
}

variable "prod_api_token_secret" {
  type        = string
  description = "The Proxmox API token secret."
  sensitive   = true
}