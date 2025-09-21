# Data output after all scripts have run.


output "vm_hostnames" {
  description = "The hostnames of the Kubernetes nodes."
  value       = proxmox_virtual_environment_vm.vmus-test-k8s-01.name
}

output "vm_ip_addresses" {
  description = "The IP addresses of the Kubernetes nodes."
  value       = proxmox_virtual_environment_vm.vmus-test-k8s-01.ipv4_addresses
}