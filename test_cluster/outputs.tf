# Data output after all scripts have run.


# For loop to print out all hostnames and addresses after. Good Check to make sure all are the right IP.
output "all_vm_details" {
  description = "Map of all VMs with their IP address and hostname."
  value = {
    "vmus-test-k8s-01" = {
      ip       = proxmox_virtual_environment_vm.vmus-test-k8s-01.ipv4_addresses[0]
      hostname = proxmox_virtual_environment_vm.vmus-test-k8s-01.name
    }
  }
}