# Data output after all scripts have run.


output "all_vm_details" {
  description = "A map of all VMs with their hostname and IP address."
  value = {
    for vm in [
      proxmox_virtual_environment_vm.vmus-test-k8s-01,
      proxmox_virtual_environment_vm.vmus-test-k8s-02,
      proxmox_virtual_environment_vm.vmus-test-k8s-03,
      proxmox_virtual_environment_vm.vmus-test-k8s-04,
      proxmox_virtual_environment_vm.vmus-test-k8s-05
    ] : vm.name => {
      hostname = vm.name
      ip       = tolist(vm.IP)[0]
    }
  }
}