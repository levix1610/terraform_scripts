# Variables to build out the MAAS server

# All variables that must be defined    
    proxmox_node        = "pmx-mr-01"
    ssh_pub_file        = "~/.ssh/powers_prod.pub"
    template_id         = 300 # Change to new image for oct 25
    vm_datastore        = "syn_nfs"
    vlan_id             = 150
    vm_name             = "vmus-prod-mas-01"
    mac_address         = "02:00:10:a0:c1:0d"
    cpu_cores           = 2
    disk_size           = 30
    vm_id               = 1015042
    memory              = 2048