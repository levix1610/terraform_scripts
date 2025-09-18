# Example of a .tf config using the older format of telmate. Moving over to bpg format because its more modern.


terraform {
    required_providers {
        proxmox = {
            source = "telmate/proxmox"
        }
    }
}

provider "proxmox" {
    pm_api_url          = "https://url-to-proxmox-server:8006/api2/json"
    pm_api_token_id     = "your-token-id"
    pm_api_token_secret = "your-secret"
    pm_tls_insecure     = true
}

resource "proxmox_vm_qemu" "vm-instance" {
    name                = "vm-instance"
    target_node         = "pve-1"
    clone               = "your-template-name"
    full_clone          = true
    cores               = 2
    memory              = 2048

    disk {
        size            = "32G"
        type            = "scsi"
        storage         = "your-storage-volume"
        discard         = "on"
    }

    network {
        model     = "virtio"
        bridge    = "vmbr1"
        firewall  = false
        link_down = false
    }

}
